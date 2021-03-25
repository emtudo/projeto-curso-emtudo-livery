defmodule EmtudoliveryWeb.WelcomeIndexController do
  use EmtudoliveryWeb, :controller

  def handle(conn, _params) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Welcome ;)"})
  end
end
