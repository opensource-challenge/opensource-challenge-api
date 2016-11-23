defmodule Github.OAuth2 do
  use OAuth2.Strategy

  def client do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: System.get_env("GITHUB_CLIENT_ID") || "c8992decd49d183b23d7",
      client_secret: System.get_env("GITHUB_CLIENT_SECRET") || "b7d210b9d6e69c608322a04d47a575f846b80c7f",
      redirect_uri: System.get_env("GITHUB_REDIRECT_URI"),
      site: "https://api.github.com",
      authorize_url: "https://github.com/login/oauth/authorize",
      token_url: "https://github.com/login/oauth/access_token"
    ])
  end

  def authorize_url! do
    OAuth2.Client.authorize_url!(client(), scope: "user,email,public_repo")
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
