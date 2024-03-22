defmodule Diet.DietsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Diet.Diets` context.
  """

  @doc """
  Generate a client_diets.
  """
  def client_diets_fixture(attrs \\ %{}) do
    {:ok, client_diets} =
      attrs
      |> Enum.into(%{
        foods: %{},
        total_calories: 42,
        total_carbohydrates: 120.5,
        total_fat: 120.5,
        total_protein: 120.5,
        user: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Diet.Diets.create_client_diets()

    client_diets
  end
end
