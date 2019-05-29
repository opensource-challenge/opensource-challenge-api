defmodule OpensourceChallenge.ContributionTest do
  use OpensourceChallenge.ModelCase

  alias OpensourceChallenge.Challenge
  alias OpensourceChallenge.Contribution

  @challenge_attrs %{
    ends_on: %{day: 24, month: 12, year: 2016},
    name: "some challenge",
    shortname: "some-2016",
    starts_on: %{day: 1, month: 12, year: 2016},
    closed: false
  }

  @valid_attrs %{
    user_id: 1,
    date: %{day: 17, month: 12, year: 2016},
    title: "Some contribution",
    description: "some content",
    link: "https://github.com/topaxi/opensource-challenge-api"
  }
  @invalid_attrs %{}

  setup do
    challenge =
      Challenge.changeset(%Challenge{}, @challenge_attrs)
      |> Repo.insert!()

    {:ok, challenge: challenge}
  end

  test "changeset with valid attributes", %{challenge: challenge} do
    attrs = Map.put(@valid_attrs, :challenge_id, challenge.id)
    changeset = Contribution.changeset(%Contribution{}, attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contribution.changeset(%Contribution{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset date after challenge", %{challenge: challenge} do
    changeset =
      Contribution.changeset(%Contribution{}, %{
        title: "Some contribution",
        description: "Some description",
        user_id: 1,
        challenge_id: challenge.id,
        date: %{
          day: 25,
          month: 12,
          year: 2015
        }
      })

    assert Keyword.has_key?(changeset.errors, :date)

    assert Keyword.get(changeset.errors, :date) ==
             {"Date must be between 2016-12-01 and 2016-12-24",
              [
                starts_on: %Ecto.Date{year: 2016, month: 12, day: 01},
                ends_on: %Ecto.Date{year: 2016, month: 12, day: 24}
              ]}
  end

  test "changeset date before challenge", %{challenge: challenge} do
    changeset =
      Contribution.changeset(%Contribution{}, %{
        title: "Some contribution",
        description: "Some description",
        user_id: 1,
        challenge_id: challenge.id,
        date: %{
          day: 30,
          month: 11,
          year: 2015
        }
      })

    assert Keyword.has_key?(changeset.errors, :date)

    assert Keyword.get(changeset.errors, :date) ==
             {"Date must be between 2016-12-01 and 2016-12-24",
              [
                starts_on: %Ecto.Date{year: 2016, month: 12, day: 01},
                ends_on: %Ecto.Date{year: 2016, month: 12, day: 24}
              ]}
  end
end
