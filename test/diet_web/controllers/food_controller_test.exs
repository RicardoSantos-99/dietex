defmodule DietWeb.FoodControllerTest do
  use DietWeb.ConnCase

  import Diet.FoodsFixtures

  alias Diet.Models.Food

  @create_attrs %{
    name: "some name",
    calories: 42,
    protein: 120.5,
    carbohydrates: 120.5,
    fat: 120.5
  }
  @update_attrs %{
    name: "some updated name",
    calories: 43,
    protein: 456.7,
    carbohydrates: 456.7,
    fat: 456.7
  }
  @invalid_attrs %{name: nil, calories: nil, protein: nil, carbohydrates: nil, fat: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get(conn, ~p"/api/foods")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/foods", food: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/foods/#{id}")

      assert %{
               "id" => ^id,
               "calories" => 42,
               "carbohydrates" => 120.5,
               "fat" => 120.5,
               "name" => "some name",
               "protein" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/foods", food: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update food" do
    setup [:create_food]

    test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
      conn = put(conn, ~p"/api/foods/#{food}", food: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/foods/#{id}")

      assert %{
               "id" => ^id,
               "calories" => 43,
               "carbohydrates" => 456.7,
               "fat" => 456.7,
               "name" => "some updated name",
               "protein" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/api/foods/#{food}", food: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn = delete(conn, ~p"/api/foods/#{food}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/foods/#{food}")
      end
    end
  end

  defp create_food(_) do
    food = food_fixture()
    %{food: food}
  end
end
