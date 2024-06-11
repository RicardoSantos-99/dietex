defmodule Diet.Profile.Imc do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "imc" do
    field :user, :string
    field :age, :integer
    field :height, :float
    field :weight, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(imc, attrs) do
    imc
    |> cast(attrs, [:age, :height, :weight, :user])
    |> validate_required([:age, :height, :weight, :user])
  end
end
