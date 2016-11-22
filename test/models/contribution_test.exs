defmodule OpensourceChallenge.ContributionTest do
  use OpensourceChallenge.ModelCase

  alias OpensourceChallenge.Contribution

  @valid_attrs %{
    date: %{day: 17, month: 4, year: 2010},
    description: "some content",
    link: "https://github.com/topaxi/opensource-challenge-api"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contribution.changeset(%Contribution{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contribution.changeset(%Contribution{}, @invalid_attrs)
    refute changeset.valid?
  end
end
