defmodule DietWeb.FoodJSON do
  alias Diet.Models.Food

  @doc """
  Renders a list of foods.
  """
  def index(%{foods: foods}) do
    %{data: for(food <- foods, do: data(food))}
  end

  @doc """
  Renders a single food.
  """
  def show(%{food: food}) do
    %{data: data(food)}
  end

  defp data(%Food{} = food) do
    %{
      id: food.id,
      name: food.name,
      calories: food.calories,
      protein: food.protein,
      carbohydrates: food.carbohydrates,
      fat: food.fat
    }
  end
end
