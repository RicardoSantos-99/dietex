defmodule Diet.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :calories, :integer
      add :protein, :float
      add :carbohydrates, :float
      add :fat, :float

      timestamps(type: :utc_datetime)
    end
  end
end
