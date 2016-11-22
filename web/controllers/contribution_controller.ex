defmodule OpensourceChallenge.ContributionController do
  use OpensourceChallenge.Web, :controller

  alias OpensourceChallenge.Contribution

  def index(conn, _params) do
    contributions = Repo.all(Contribution)

    render(conn, "index.json-api", data: contributions)
  end

  def show(conn, %{"id" => id}) do
    contribution = Repo.get!(Contribution, id)

    render(conn, "show.json-api", data: contribution)
  end

  def create(conn, %{"data" => data}) do
    attrs = JaSerializer.Params.to_attributes(data)
    changeset = Contribution.changeset(%Contribution{}, attrs)

    case Repo.insert(changeset) do
      {:ok, contribution} ->
        conn
        |> put_status(201)
        |> render("show.json-api", data: contribution)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(OpensourceChallenge.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
