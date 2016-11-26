defmodule OpensourceChallenge.Router do
  use OpensourceChallenge.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api/v1", OpensourceChallenge do
    pipe_through :api

    post "/register", RegistrationController, :create
    post "/token", SessionController, :create, as: :login

    get "/challenges/current", ChallengeController, :current
    resources "/challenges", ChallengeController, only: [:show, :index] do
      get "/contributions", ContributionController, :index, as: :contributions
      get "/users", UserController, :index, as: :users
    end

    resources "/users", UserController, only: [:show, :index] do
      get "/contributions", ContributionController, :index, as: :contributions
    end
    resources "/contributions", ContributionController, only: [:show, :index, :create]
  end

  scope "/api/v1", OpensourceChallenge do
    pipe_through :api_auth

    get "/users/current", UserController, :current
  end
end
