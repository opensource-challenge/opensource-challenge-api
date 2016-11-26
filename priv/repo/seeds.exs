# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OpensourceChallenge.Repo.insert!(%OpensourceChallenge.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Ecto.Date

alias OpensourceChallenge.Repo
alias OpensourceChallenge.Challenge
alias OpensourceChallenge.User
alias OpensourceChallenge.Contribution

Repo.insert! %Challenge{
  name: "Thömus Open Source Advents Challenge 2015",
  shortname: "advent-2015",
  starts_on: %Date{year: 2015, month: 12, day: 1},
  ends_on: %Date{year: 2015, month: 12, day: 24}
}
Repo.insert! %Challenge{
  name: "Damians Open Source Advents Challenge 2016",
  shortname: "advent-2016",
  starts_on: %Date{year: 2016, month: 12, day: 1},
  ends_on: %Date{year: 2016, month: 12, day: 24}
}
