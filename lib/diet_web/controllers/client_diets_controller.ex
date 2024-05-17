defmodule DietWeb.ClientDietsController do
  use DietWeb, :controller

  alias Diet.Repositories.Diets
  alias Diet.Models.ClientDiets

  action_fallback DietWeb.FallbackController

  def index(conn, _params) do
    user_foods = Diets.list_user_foods()
    render(conn, :index, user_foods: user_foods)
  end

  def create(conn, %{"foods" => client_diets_params, "user" => user, "total_water" => water}) do
    diet = get_total(client_diets_params) |> Map.put(:user, user) |> Map.put(:total_water, water)

    with {:ok, %ClientDiets{} = client_diets} <- Diets.create_client_diets(diet) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/user_foods/#{client_diets}")
      |> render(:show, client_diets: client_diets)
    end
  end

  def get_total(client_diets_params) do
    acc = %{total_calories: 0, total_protein: 0, total_carbohydrates: 0, total_fat: 0}

    Enum.reduce(client_diets_params, acc, fn food, acc ->
      %{
        total_calories: acc.total_calories + food["calories"],
        total_protein: acc.total_protein + food["protein"],
        total_carbohydrates: acc.total_carbohydrates + food["carbohydrates"],
        total_fat: acc.total_fat + food["fat"]
      }
    end)
    |> Map.put(:foods, %{foods: client_diets_params})
  end

  def show(conn, %{"id" => id}) do
    client_diets = Diets.get_client_diets!(id)
    render(conn, :show, client_diets: client_diets)
  end

  def update(conn, %{"id" => id, "client_diets" => client_diets_params}) do
    client_diets = Diets.get_client_diets!(id)

    with {:ok, %ClientDiets{} = client_diets} <-
           Diets.update_client_diets(client_diets, client_diets_params) do
      render(conn, :show, client_diets: client_diets)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_diets = Diets.get_client_diets!(id)

    with {:ok, %ClientDiets{}} <- Diets.delete_client_diets(client_diets) do
      send_resp(conn, :no_content, "")
    end
  end
end
