defmodule OpensourceChallengeWeb.UserControllerTest do
  use OpensourceChallengeWeb.ConnCase

  alias OpensourceChallenge.User

  setup %{conn: conn} do
    user =
      Repo.insert!(
        User.create_changeset(%User{}, %{
          name: "Damian",
          email: "damian.senn@example.com",
          password: "1234qwer",
          password_confirmation: "1234qwer",
          admin: true
        })
      )

    {:ok, jwt, _full_claims} = OpensourceChallengeWeb.Guardian.encode_and_sign(user)

    {:ok,
     user_id: user.id, jwt: jwt, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  test "current user", %{conn: conn, jwt: jwt} do
    conn =
      conn
      |> put_req_header("authorization", "Bearer #{jwt}")
      |> get(user_path(conn, :current))

    assert json_response(conn, 200)["data"]["attributes"]["name"] == "Damian"
  end

  test "user by id as normal user", %{conn: conn, user_id: user_id} do
    user =
      Repo.insert!(
        User.create_changeset(%User{}, %{
          name: "Normalo",
          email: "normalo@example.com",
          password: "1234qwer",
          password_confirmation: "1234qwer",
          admin: false
        })
      )

    {:ok, jwt, _full_claims} = OpensourceChallengeWeb.Guardian.encode_and_sign(user)

    conn =
      conn
      |> put_req_header("authorization", "Bearer #{jwt}")
      |> get(user_path(conn, :show, user_id))

    res = json_response(conn, 200)

    assert res["data"]["attributes"]["name"] == "Damian"
    assert res["data"]["attributes"]["email"] == nil

    assert String.match?(
             res["data"]["relationships"]["contributions"]["links"]["related"],
             ~r[http://localhost:4001/api/v1/users/\d+/contributions]
           )
  end

  test "admins receive user emails", %{conn: conn, jwt: jwt, user_id: user_id} do
    conn =
      conn
      |> put_req_header("authorization", "Bearer #{jwt}")
      |> get(user_path(conn, :show, user_id))

    assert json_response(conn, 200)["data"]["attributes"]["email"] == "damian.senn@example.com"
  end
end
