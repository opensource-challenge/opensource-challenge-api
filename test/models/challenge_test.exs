defmodule OpensourceChallenge.ChallengeTest do
  use OpensourceChallenge.ModelCase

  alias OpensourceChallenge.Challenge

  @valid_attrs %{
    ends_on: %{day: 17, month: 4, year: 2010},
    name: "some challenge",
    shortname: "some-2010",
    starts_on: %{day: 17, month: 4, year: 2010}
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
