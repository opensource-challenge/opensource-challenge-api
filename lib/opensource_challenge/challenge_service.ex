defmodule OpensourceChallenge.ChallengeService do
  import Ecto.Query

  def latest_challenge do
    now = DateTime.utc_now()

    OpensourceChallenge.Challenge
    |> where([c], c.starts_on < ^now or not c.closed)
    |> order_by(desc: :starts_on)
    |> limit(1)
  end
end
