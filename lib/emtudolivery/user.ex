defmodule Emtudolivery.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias Emtudolivery.Order

  @required_params [:age, :address, :cep, :cpf, :email, :password, :name]
  @required_update_params @required_params -- [:password]

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :age, :cpf, :address, :email, :name]}

  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    has_many :orders, Order

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(user \\ %__MODULE__{}, params) do
    fields = get_required_fields(user)

    user
    |> cast(params, @required_params)
    |> validate_required(fields)
    |> validate_length(:password, min: 8)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
    |> put_password_hash()
  end

  defp get_required_fields(%__MODULE__{id: id}) when is_nil(id), do: @required_params

  defp get_required_fields(_), do: @required_update_params

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
