defmodule EmtudoliveryWeb.UserSigninController do
  use EmtudoliveryWeb, :controller
  alias EmtudoliveryWeb.Auth.Guardian
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_view(EmtudoliveryWeb.UserView)
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
