defmodule Emtudolivery.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Emtudolivery.{Item, User}

  @required_params [:address, :comments, :payment_method, :user_id]
  @derive {Jason.Encoder, only: @required_params ++ [:id, :items]}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @payment_methods [:money, :credit_card, :debit_card]

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Ecto.Enum, values: @payment_methods

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(order \\ %__MODULE__{}, params, items) do
    order
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
  end
end
