defmodule Diet.Repo.Migrations.CreateImc do
  use Ecto.Migration

  def change do
    create table(:imc, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :age, :integer
      add :height, :float
      add :weight, :float
      add :user, :string

      timestamps(type: :utc_datetime)
    end
  end
end
