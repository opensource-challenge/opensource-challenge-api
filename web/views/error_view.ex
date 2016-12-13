defmodule OpensourceChallenge.ErrorView do
  use OpensourceChallenge.Web, :view

  def render("401.json", _assigns) do
    %{title: "Unauthorized", code: 401}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("403.json", _assigns) do
    %{title: "Forbidden", code: 403}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("404.json", _assigns) do
    %{title: "Page Not Found", code: 404}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("415.json", _assigns) do
    %{title: "Unsupported Media Type", code: 415}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("500.json", %{code: code}) do
    %{title: "Internal Server Error", code: code}
    |> JaSerializer.ErrorSerializer.format
  end

  def render("500.json", _assigns) do
    render "500.json", %{code: 500}
  end

  def render(template, assigns) do
    template_not_found(template, assigns)
  end

  def template_not_found(template, assigns) do
    {code, _} = template
                |> Integer.parse

    render "500.json", Map.put(assigns, :code, code)
  end
end
