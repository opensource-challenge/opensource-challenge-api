defmodule OpensourceChallengeWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use OpensourceChallenge.Web, :controller
      use OpensourceChallenge.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: OpensourceChallengeWeb
      use JaResource

      alias OpensourceChallenge.Repo
      import Ecto
      import Ecto.Query
      import Canary.Plugs

      import OpensourceChallengeWeb.Router.Helpers
      import OpensourceChallengeWeb.Gettext
    end
  end

  def view do
    quote do
      use JaSerializer.PhoenixView

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [
          get_csrf_token: 0,
          get_flash: 2,
          view_module: 1
        ]

      import OpensourceChallengeWeb.Router.Helpers
      import OpensourceChallengeWeb.ErrorHelpers
      import OpensourceChallengeWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias OpensourceChallenge.Repo
      import Ecto
      import Ecto.Query
      import OpensourceChallengeWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
