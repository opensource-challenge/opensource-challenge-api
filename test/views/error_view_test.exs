defmodule OpensourceChallenge.ErrorViewTest do
  use OpensourceChallenge.ConnCase, async: true

  import Phoenix.View

  test "renders 404.json" do
    assert render(OpensourceChallenge.ErrorView, "404.json", []) ==
      %{
        "errors" => [%{code: 404, title: "Page Not Found"}],
        "jsonapi" => %{"version" => "1.0"},
      }
  end

  test "renders 403.json" do
    assert render(OpensourceChallenge.ErrorView, "403.json", []) ==
      %{
        "errors" => [%{code: 403, title: "Forbidden"}],
        "jsonapi" => %{"version" => "1.0"},
      }
  end

  test "renders 415.json" do
    assert render(OpensourceChallenge.ErrorView, "415.json", []) ==
      %{
        "errors" => [%{code: 415, title: "Unsupported Media Type"}],
        "jsonapi" => %{"version" => "1.0"},
      }
  end

  test "render 500.json" do
    assert render(OpensourceChallenge.ErrorView, "500.json", []) ==
      %{
        "errors" => [%{code: 500, title: "Internal Server Error"}],
        "jsonapi" => %{"version" => "1.0"},
      }
  end

  test "render any other" do
    assert render(OpensourceChallenge.ErrorView, "505.json", []) ==
      %{
        "errors" => [%{code: 505, title: "Internal Server Error"}],
        "jsonapi" => %{"version" => "1.0"},
      }
  end
end
