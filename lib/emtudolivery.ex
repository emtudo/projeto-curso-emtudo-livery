defmodule Emtudolivery do
  alias Emtudolivery.Items.Create, as: ItemCreate

  alias Emtudolivery.Orders.Create, as: OrderCreate

  alias Emtudolivery.Users.Create, as: UserCreate
  alias Emtudolivery.Users.Delete, as: UserDelete
  alias Emtudolivery.Users.Get, as: UserGet
  alias Emtudolivery.Users.Update, as: UserUpdate

  defdelegate create_item(params), to: ItemCreate, as: :call
  defdelegate create_order(params), to: OrderCreate, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(user_id), to: UserGet, as: :by_id
  defdelegate delete_user(user_id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
end
