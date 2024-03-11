defmodule Diet.FoodsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Diet.Foods` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        calories: 42,
        carbohydrates: 120.5,
        fat: 120.5,
        name: "some name",
        protein: 120.5
      })
      |> Diet.Foods.create_food()

    food
  end
end
