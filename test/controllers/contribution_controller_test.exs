defmodule OpensourceChallenge.ContributionControllerTest do
  use OpensourceChallenge.ConnCase

  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.User
  alias OpensourceChallenge.Contribution

  @valid_attrs %{
    title: "Some contribution",
    date: %Ecto.Date{year: 2016, month: 12, day: 1},
    description: "Did a contribution"
  }

  @invalid_attrs %{
  }

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
      conn: conn
            |> put_req_header("accept", "application/vnd.api+json")
            |> put_req_header("content-type", "application/vnd.api+json")}
  end

  test "lists contributions",
      %{conn: conn, challenge_id: challenge_id, user_id: user_id} do
    Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 1},
      link: "",
      title: "Contribution 1 title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })
    Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 2},
      link: "",
      title: "Contribution 2 title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })

    conn = conn
    |> get(contribution_path(conn, :index))

    assert json_response(conn, 200)
    data = json_response(conn, 200)["data"]
    assert Enum.at(data, 0)["attributes"]["title"] === "Contribution 1 title"
    assert Enum.at(data, 1)["attributes"]["title"] === "Contribution 2 title"
  end

  test "filters contributions",
      %{conn: conn, challenge_id: challenge_id, user_id: user_id} do
    Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 1},
      link: "",
      title: "Contribution 1 title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })
    Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 2},
      link: "",
      title: "Contribution 2 title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })

    conn = conn
    |> get(contribution_path(conn, :index, %{filter: %{date: "2016-12-02"}}))

    assert json_response(conn, 200)
    data = json_response(conn, 200)["data"]
    assert Enum.at(data, 0)["attributes"]["title"] === "Contribution 2 title"
  end

  test "includes users in contributions",
      %{conn: conn, challenge_id: challenge_id, user_id: user_id} do
    Repo.insert!(Contribution.changeset %Contribution{}, %{
      date: %Ecto.Date{year: 2016, month: 12, day: 1},
      link: "",
      title: "Contribution 1 title",
      description: "Contribution description",
      user_id: user_id,
      challenge_id: challenge_id
    })

    conn = conn
    |> get(contribution_path(conn, :index, %{include: "user"}))

    assert json_response(conn, 200)
    assert json_response(conn, 200)["included"]
    included = json_response(conn, 200)["included"]
    assert Enum.at(included, 0)["attributes"]["name"] == "Damian"
  end

  test "creates and renders resource when data is valid",
      %{conn: conn, jwt: jwt} do
    conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> post(contribution_path(conn, :create), %{
      data: %{
        type: "contributions",
        attributes: @valid_attrs
      }
    })

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get(Contribution, json_response(conn, 201)["data"]["id"])
  end

  test "does not create resource and renders errors when data is invalid",
      %{conn: conn, jwt: jwt} do
    conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> post(contribution_path(conn, :create), %{
      data: %{
        type: "contributions",
        attributes: @invalid_attrs
      }
    })

    assert json_response(conn, 422)
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
