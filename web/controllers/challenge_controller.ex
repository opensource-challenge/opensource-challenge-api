defmodule OpensourceChallenge.ChallengeController do
  use OpensourceChallenge.Web, :controller

  plug JaResource

  import Ecto.Query

  alias Ecto.DateTime
  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.ChallengeService

  def handle_current(conn, %{"include" => include}) do
    includes = include
               |> String.split(",")
               |> Enum.map(&String.to_atom/1)
    conn
    |> handle_current(%{})
    |> preload(^includes)
  end

  def handle_current(_conn, _params) do
    ChallengeService.latest_challenge
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
