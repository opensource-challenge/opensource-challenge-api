defmodule OpensourceChallenge.ContributionControllerTest do
  use OpensourceChallenge.ConnCase

  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.User
  alias OpensourceChallenge.Contribution

  setup %{conn: conn} do
    user = Repo.insert!(User.changeset %User{}, %{
      name: "Damian",
      email: "damian.senn@example.com",
      password: "1234qwer",
      password_confirmation: "1234qwer"
    })

    challenge = Repo.insert!(Challenge.changeset %Challenge{}, %{
      name: "Some challenge",
      shortname: "challenge",
      starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
      ends_on: %Ecto.Date{year: 2016, month: 12, day: 24}
    })

    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
    {:ok,
      challenge_id: challenge.id,
      user_id: user.id,
      jwt: jwt,
      conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  test "deleting own contribution",
      %{conn: conn, jwt: jwt, user_id: user_id, challenge_id: challenge_id} do
    contribution = Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 1},
      link: "",
      title: "Contribution title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })

    conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> delete(contribution_path(conn, :delete, contribution.id))

    assert response(conn, 204)

    assert_raise Ecto.NoResultsError, fn ->
      Repo.get!(Contribution, contribution.id)
    end
  end

  test "deleting someone elses contribution",
      %{conn: conn, user_id: user_id, challenge_id: challenge_id} do
    contribution = Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 1},
      link: "",
      title: "Contribution title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })

    user = Repo.insert!(User.changeset %User{}, %{
      name: "Not damian",
      email: "notdamian.senn@example.com",
      password: "1234qwer",
      password_confirmation: "1234qwer"
    })

    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)

    conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> delete(contribution_path(conn, :delete, contribution.id))

    assert json_response(conn, 403)

    assert Repo.get!(Contribution, contribution.id) == contribution
  end
end
