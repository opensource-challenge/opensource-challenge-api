defmodule OpensourceChallenge.ChallengeService do
  import Ecto.Query

  def latest_challenge do
    now = Ecto.DateTime.from_erl(:erlang.localtime)
    challenge = OpensourceChallenge.Challenge
    |> where([c], c.starts_on < ^now)
    |> order_by(desc: :starts_on)
    |> limit(1)
  end
end
