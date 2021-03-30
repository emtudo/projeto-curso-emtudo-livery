defmodule Emtudolivery.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Emtudolivery.Order

  @required_params [:category, :photo, :description, :price]

  @primary_key {:id, :binary_id, autogenerate: true}

  @items_categories [:food, :drink, :desert]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Ecto.Enum, values: @items_categories
    field :photo, :string
    field :description, :string
    field :price, :decimal

    many_to_many :orders, Order, join_through: "orders_items"

    timestamps()
  end

  def changeset(item \\ %__MODULE__{}, params) do
    item
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
