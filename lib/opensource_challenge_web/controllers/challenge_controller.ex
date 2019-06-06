defmodule OpensourceChallengeWeb.ChallengeController do
  use OpensourceChallengeWeb, :controller

  import Ecto.Query, only: [where: 2, preload: 2]

  alias OpensourceChallenge.Repo
  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.ChallengeService

  plug(:scrub_params, "data" when action in [:create, :update])

  plug(:authorize_resource,
    model: Challenge,
    except: [:show, :index, :current]
  )

  plug(JaResource)

  def model, do: Challenge

  def records(%Plug.Conn{query_params: %{"include" => include}} = conn) do
    model()
    |> preload(^parse_include(include))
  end

  def records(_conn), do: model()

  def handle_current(conn, %{"include" => include} = opts) do
    conn
    |> handle_current(Map.delete(opts, "include"))
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
    |> Enum.map(fn str ->
      if String.contains?(str, ".") do
        [a, b] =
          str
          |> String.split(".")
          |> Enum.map(&String.to_atom/1)

        [{a, b}]
      else
        String.to_atom(str)
      end
    end)
  end
end
