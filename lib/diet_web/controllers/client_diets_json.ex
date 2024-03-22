defmodule DietWeb.ClientDietsJSON do
  alias Diet.Diets.ClientDiets

  @doc """
  Renders a list of user_foods.
  """
  def index(%{user_foods: user_foods}) do
    %{data: for(client_diets <- user_foods, do: data(client_diets))}
  end

  @doc """
  Renders a single client_diets.
  """
  def show(%{client_diets: client_diets}) do
    %{data: data(client_diets)}
  end

  defp data(%ClientDiets{} = client_diets) do
    %{
      id: client_diets.id,
      user: client_diets.user,
      foods: client_diets.foods,
      total_calories: client_diets.total_calories,
      total_protein: client_diets.total_protein,
      total_carbohydrates: client_diets.total_carbohydrates,
      total_fat: client_diets.total_fat
    }
  end
end
