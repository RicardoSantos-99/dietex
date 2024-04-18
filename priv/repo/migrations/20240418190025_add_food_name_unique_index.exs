defmodule Diet.Repo.Migrations.AddFoodNameUniqueIndex do
  use Ecto.Migration

  def change do
    create unique_index(:foods, [:name])
  end
end
