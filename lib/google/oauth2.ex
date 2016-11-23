defmodule Google.OAuth2 do
  use OAuth2.Strategy

  def client do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: System.get_env("GOOGLE_CLIENT_ID") || "586953290562-c896enmb9em22uv4bc4p63h97pp111h3.apps.googleusercontent.com",
      client_secret: System.get_env("GOOGLE_CLIENT_SECRET") || "LkAB93OxLLOtiioQn7lWi5hO",
      redirect_uri: System.get_env("GOOGLE_REDIRECT_URI") || "http://localhost:4200/",
      site: "https://www.googleapis.com",
      authorize_url: "https://accounts.google.com/o/oauth2/auth",
      token_url: "https://accounts.google.com/o/oauth2/token"
    ])
  end

  def authorize_url! do
    OAuth2.Client.authorize_url!(client(), scope: "email")
  end

  # you can pass options to the underlying http library via `opts` parameter
  def get_token!(params \\ [], headers \\ [], opts \\ []) do
    OAuth2.Client.get_token!(client(), params, headers, opts)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
