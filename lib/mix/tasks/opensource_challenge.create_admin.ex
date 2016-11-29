defmodule Mix.Tasks.OpensourceChallenge.CreateAdmin do
  use Mix.Task
  import Mix.Ecto

  alias OpensourceChallenge.User

  @shortdoc "Creates a new admin user"

  @moduledoc """
    Creates a new admin user to manage the OpenSource Challenges
  """

  def run(args) do
    [ repo ] = parse_repo(args)

    ensure_repo(repo, args)
    ensure_started(repo, [])

    username = "Username:" |> Mix.shell.prompt |> String.strip
    email    = "Email:" |> Mix.shell.prompt |> String.strip
    password = "Password:" |> password_get |> String.strip
    confirm  = "Password (confirm):" |> password_get |> String.strip

    if password != confirm do
      Mix.raise "Entered passwords do not match"
    end

    changeset = User.changeset(%User{}, %{
                                 name: username,
                                 email: email,
                                 password: password,
                                 password_confirmation: confirm,
                                 admin: true
                               })

    repo.insert! changeset
  end

  # Password prompt that hides input by every 1ms
  # clearing the line with stderr
  def password_get(prompt) do
    if Hex.State.fetch!(:clean_pass) do
      password_clean(prompt)
    else
      Mix.shell.prompt(prompt <> " ")
    end
  end

  defp password_clean(prompt) do
    pid   = spawn_link(fn -> loop(prompt) end)
    ref   = make_ref()
    value = IO.gets(prompt <> " ")

    send pid, {:done, self(), ref}
    receive do: ({:done, ^pid, ^ref}  -> :ok)

    value
  end

  defp loop(prompt) do
    receive do
      {:done, parent, ref} ->
        send parent, {:done, self(), ref}
        IO.write(:standard_error, "\e[2K\r")
    after
      1 ->
        IO.write(:standard_error, "\e[2K\r#{prompt} ")
        loop(prompt)
    end
  end
end
