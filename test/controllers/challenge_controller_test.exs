defmodule OpensourceChallenge.ChallengeControllerTest do
  use OpensourceChallenge.ConnCase

  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.User
  alias OpensourceChallenge.Contribution

  @valid_attrs %{
    title: "Some Challenge",
    shortname: "some-challenge",
    starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
    ends_on: %Ecto.Date{year: 2016, month: 12, day: 24},
    closed: false,
  }

  @invalid_attrs %{
  }

  setup %{conn: conn} do
    user = Repo.insert!(User.create_changeset %User{}, %{
      name: "Damian",
      email: "damian.senn@example.com",
      password: "1234qwer",
      password_confirmation: "1234qwer"
    })

    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
    {:ok,
      user_id: user.id,
      jwt: jwt,
      conn: conn
            |> put_req_header("accept", "application/vnd.api+json")
            |> put_req_header("content-type", "application/vnd.api+json")}
  end

  test "lists challenges", %{conn: conn, user_id: user_id} do
    Repo.insert!(Challenge.changeset %Challenge{}, %{
      name: "Some challenge",
      shortname: "some-challenge",
      starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
      ends_on: %Ecto.Date{year: 2016, month: 12, day: 24},
      closed: false
    })
    Repo.insert!(Challenge.changeset %Challenge{}, %{
      name: "Some challenge 2",
      shortname: "some-challenge-2",
      starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
      ends_on: %Ecto.Date{year: 2016, month: 12, day: 24},
      closed: false
    })

    conn = conn
    |> get(challenge_path(conn, :index))

    assert json_response(conn, 200)
    data = json_response(conn, 200)["data"]
    assert length(data) == 2
    assert Enum.at(data, 0)["attributes"]["name"] === "Some challenge"
    assert Enum.at(data, 1)["attributes"]["name"] === "Some challenge 2"
  end

  test "filters challenges", %{conn: conn, user_id: user_id} do
    Repo.insert!(Challenge.changeset %Challenge{}, %{
      name: "Some challenge",
      shortname: "some-challenge",
      starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
      ends_on: %Ecto.Date{year: 2016, month: 12, day: 24},
      closed: false
    })
    Repo.insert!(Challenge.changeset %Challenge{}, %{
      name: "Some challenge 2",
      shortname: "some-challenge-2",
      starts_on: %Ecto.Date{year: 2016, month: 12, day: 1},
      ends_on: %Ecto.Date{year: 2016, month: 12, day: 24},
      closed: true
    })

    conn = conn
    |> get(challenge_path(conn, :index, %{filter: %{closed: "true"}}))

    assert json_response(conn, 200)
    data = json_response(conn, 200)["data"]
    assert length(data) == 1
    assert Enum.at(data, 0)["attributes"]["name"] === "Some challenge 2"
  end

end
