defmodule Diet.Repo.Migrations.CreateUserFoods do
  use Ecto.Migration

  def change do
    create table(:user_foods, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user, :uuid
      add :foods, :map
      add :total_calories, :integer
      add :total_protein, :float
      add :total_carbohydrates, :float
      add :total_fat, :float

      timestamps(type: :utc_datetime)
    end
  end
end
