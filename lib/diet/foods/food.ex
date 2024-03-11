defmodule Diet.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:name, :calories, :protein, :carbohydrates, :fat])
    |> validate_required([:name, :calories, :protein, :carbohydrates, :fat])
  end
end
