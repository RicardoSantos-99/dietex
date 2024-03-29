defmodule Diet.Diets.ClientDiets do
  use Ecto.Schema
  import Ecto.Changeset

  @params ~w(user foods total_calories total_protein total_carbohydrates total_fat)a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user_foods" do
    field :user, Ecto.UUID
    field :foods, :map
    field :total_calories, :integer
    field :total_protein, :float
    field :total_carbohydrates, :float
    field :total_fat, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client_diets, attrs) do
    client_diets
    |> cast(attrs, @params)
    |> validate_required(@params)
  end
end
