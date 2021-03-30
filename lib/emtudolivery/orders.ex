defmodule Emtudolivery.ORder do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:address, :comments, :payment_method, :user_id]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @payment_methods [:money, :credit_card, :debit_card]

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Ecto.Enum, values: @payment_methods
    field :user_id

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
