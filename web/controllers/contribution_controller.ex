defmodule OpensourceChallenge.ContributionController do
  use OpensourceChallenge.Web, :controller

  plug JaResource

  import Ecto.Query

  alias OpensourceChallenge.Contribution

  def handle_index(_conn, %{"include" => include}) do
    includes = include
               |> String.split(",")
               |> Enum.map(&String.to_atom/1)

    Contribution
    |> preload(^includes)
  end

  def handle_index(_conn, _params) do
    Contribution
  end

  def filter(_conn, query, "user_id", user_id) do
    where(query, user_id: ^user_id)
  end

  def filter(_conn, query, "challenge_id", challenge_id) do
    where(query, challenge_id: ^challenge_id)
  end

  def filter(_conn, query, "date", date) do
    where(query, date: ^date)
  end
end
