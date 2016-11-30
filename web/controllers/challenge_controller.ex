defmodule OpensourceChallenge.ChallengeController do
  use OpensourceChallenge.Web, :controller

  plug JaResource

  import Ecto.Query

  alias Ecto.DateTime
  alias OpensourceChallenge.Challenge

  def handle_current(conn, %{"include" => include}) do
    includes = include
               |> String.split(",")
               |> Enum.map(&String.to_atom/1)
    conn
    |> handle_current(%{})
    |> preload(^includes)
  end

  def handle_current(_conn, _params) do
    now = DateTime.from_erl(:erlang.localtime)
    Challenge
    |> where([c], c.starts_on < ^now)
    |> order_by(:starts_on)
  end

  def current(conn, params) do
    challenge = conn
                |> handle_current(params)
                |> Repo.one!
    render(conn, "show.json-api", data: challenge, opts: [
             include: params["include"]
           ])
  end
end
