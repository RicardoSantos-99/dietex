defmodule Diet.Models.Food do
  use Ecto.Schema
  import Ecto.Changeset

  @params ~w(name calories protein carbohydrates fat)a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "foods" do
    field :name, :string
    field :calories, :integer
    field :protein, :float
    field :carbohydrates, :float
    field :fat, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, @params)
    |> validate_required(@params)
    |> validate_number(:calories, greater_than: 0)
    |> validate_number(:protein, greater_than: 0)
    |> validate_number(:carbohydrates, greater_than: 0)
    |> validate_number(:fat, greater_than: 0)
    |> unique_constraint(:name)
  end
end
