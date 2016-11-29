defmodule OpensourceChallenge.UserControllerTest do
  use OpensourceChallenge.ConnCase

  alias OpensourceChallenge.User

  setup %{conn: conn} do
    user = Repo.insert!(User.changeset %User{}, %{
      name: "Damian",
      email: "damian.senn@example.com",
      password: "1234qwer",
      password_confirmation: "1234qwer"
    })

    {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
    {:ok,
      user_id: user.id,
      jwt: jwt,
      conn: put_req_header(conn, "accept", "application/vnd.api+json")}
  end

  test "current user", %{conn: conn, jwt: jwt} do
    conn = conn
    |> put_req_header("authorization", "Bearer #{jwt}")
    |> get(user_path(conn, :current))

    assert json_response(conn, 200)["data"]["attributes"]["name"] == "Damian"
  end

  test "user by id", %{conn: conn, user_id: user_id} do
    conn = get conn, user_path(conn, :show, user_id)

    assert json_response(conn, 200)["data"]["attributes"]["name"] == "Damian"
  end
end
