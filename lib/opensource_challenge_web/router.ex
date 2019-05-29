defmodule OpensourceChallengeWeb.Router do
  use OpensourceChallengeWeb, :router

  pipeline :unauthenticated do
    plug(:accepts, ["json", "json-api"])
  end

  pipeline :api do
    plug(:accepts, ["json", "json-api"])
    plug(OpensourceChallengeWeb.Guardian.GuardianPipeline)
    plug(OpensourceChallengeWeb.Plug.CurrentUser)
    plug(JaSerializer.ContentTypeNegotiation)
    plug(JaSerializer.Deserializer)
  end

  pipeline :api_auth do
    plug(:accepts, ["json", "json-api"])
    plug(OpensourceChallengeWeb.Guardian.AuthPipeline)
    plug(OpensourceChallengeWeb.Plug.CurrentUser)
    plug(JaSerializer.ContentTypeNegotiation)
    plug(JaSerializer.Deserializer)
  end

  scope "/api/v1", OpensourceChallengeWeb do
    pipe_through(:api_auth)

    get("/users/current", UserController, :current)

    resources("/users", UserController, only: [:update])

    resources("/contributions", ContributionController, only: [:create, :update, :delete])
  end

  scope "/api/v1", OpensourceChallengeWeb do
    pipe_through(:unauthenticated)

    post("/register", RegistrationController, :create)
    post("/token", SessionController, :create, as: :login)
  end

  scope "/api/v1", OpensourceChallengeWeb do
    pipe_through(:api)

    get("/challenges/current", ChallengeController, :current)

    resources "/challenges", ChallengeController, only: [:show, :index] do
      get("/contributions", ContributionController, :index, as: :contributions)
      get("/users", UserController, :index, as: :users)
    end

    resources "/users", UserController, only: [:show, :index] do
      get("/contributions", ContributionController, :index, as: :contributions)
    end

    resources("/contributions", ContributionController, only: [:show, :index])
  end
end
