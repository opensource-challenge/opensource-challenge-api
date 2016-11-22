defmodule OpensourceChallenge.UserTest do
  use OpensourceChallenge.ModelCase

  alias OpensourceChallenge.User

  @valid_attrs %{
    company: "some content",
    email: "topaxi@example.com",
    name: "some content",
    password: "1234qwer",
    password_confirmation: "1234qwer",
    picture: "some content",
    website: "some content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                 password: "1lh2bj1rjbk2",
                                 password_confirmation: "b1bk23jkn12"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                 password: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                 password: "1lh2d",
                                 password_confirmation: "1lh2d"})
    refute changeset.valid?
  end
end
