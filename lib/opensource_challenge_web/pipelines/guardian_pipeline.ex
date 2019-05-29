defmodule OpensourceChallengeWeb.Guardian.GuardianPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :opensource_challenge,
    module: OpensourceChallengeWeb.Guardian,
    error_handler: OpensourceChallengeWeb.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
