defmodule EmtudoliveryWeb.UserCreateController do
  use EmtudoliveryWeb, :controller
  alias Emtudolivery.User
  alias EmtudoliveryWeb.Auth.Guardian
  alias EmtudoliveryWeb.FallbackController

  action_fallback FallbackController

  def handle(conn, params) do
    with {:ok, %User{} = user} <- Emtudolivery.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> put_view(EmtudoliveryWeb.UserView)
      |> render("create.json", token: token, user: user)
    end
  end
end
