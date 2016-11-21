defmodule OpensourceChallenge.Router do
  use OpensourceChallenge.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OpensourceChallenge do
    pipe_through :api
  end
end
