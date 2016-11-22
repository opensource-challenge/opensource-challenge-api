defmodule OpensourceChallenge.RegistrationController do
  use OpensourceChallenge.Web, :controller

  alias OpensourceChallenge.User

  def create(conn, %{
        "data" => %{
          "type" => "users",
          "attributes" => %{
            "name" => name,
            "email" => email,
            "password" => password,
            "password-confirmation" => password_confirmation
          }
        }
      }) do
    changeset = User.changeset(%User{}, %{
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    })

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(OpensourceChallenge.UserView, "show.json-api", data: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(OpensourceChallenge.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
