defmodule OpensourceChallengeWeb.ChallengeController do
  use OpensourceChallengeWeb, :controller

  plug(JaResource)

  import Ecto.Query

  alias OpensourceChallenge.ChallengeService

  def model, do: OpensourceChallenge.Challenge

  def handle_current(conn, %{"include" => include}) do
    conn
    |> handle_current(%{})
    |> preload(^parse_include(include))
  end

  def handle_current(_conn, _params) do
    ChallengeService.latest_challenge()
  end

  def current(conn, params) do
    challenge =
      conn
      |> handle_current(params)
      |> Repo.one!()

    render(conn, "show.json-api",
      data: challenge,
      opts: [
        include: params["include"]
      ]
    )
  end

  def filter(_conn, query, "closed", closed) do
    closed = closed == "true"

    where(query, closed: ^closed)
  end

  defp parse_include(include) do
    include
    |> String.split(",")
    |> Enum.map(&String.to_atom/1)
  end
end
