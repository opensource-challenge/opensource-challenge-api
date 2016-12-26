defmodule OpensourceChallenge.ContributionTest do
  use OpensourceChallenge.ModelCase

  alias OpensourceChallenge.Contribution

  @valid_attrs %{
    user_id: 1,
    challenge_id: 1,
    date: %{day: 17, month: 12, year: 2016},
    title: "Some contribution",
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

  test "changeset date after challenge" do
    changeset = Contribution.changeset(%Contribution{}, %{
                                         date: %{
                                           day: 25,
                                           month: 12,
                                           year: 2016
                                         }
                                       })
    assert Keyword.has_key?(changeset.errors, :date)
  end

  test "changeset date before challenge" do
    changeset = Contribution.changeset(%Contribution{}, %{
                                         date: %{
                                           day: 30,
                                           month: 11,
                                           year: 2016
                                         }
                                       })
    assert Keyword.has_key?(changeset.errors, :date)
  end
end
