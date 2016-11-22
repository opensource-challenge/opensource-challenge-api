defmodule OpensourceChallenge.ErrorViewTest do
  use OpensourceChallenge.ConnCase, async: true

  import Phoenix.View

  test "renders 404.json" do
    assert render(OpensourceChallenge.ErrorView, "404.json", []) ==
           %{"errors" => [%{code: 404, title: "Page Not Found"}]}
  end

  test "renders 403.json" do
    assert render(OpensourceChallenge.ErrorView, "403.json", []) ==
           %{"errors" => [%{code: 403, title: "Forbidden"}]}
  end

  test "render 500.json" do
    assert render(OpensourceChallenge.ErrorView, "500.json", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}]}
  end

  test "render any other" do
    assert render(OpensourceChallenge.ErrorView, "505.json", []) ==
           %{"errors" => [%{code: 505, title: "Internal Server Error"}]}
  end
end
