defmodule DietWeb.ClientDietsControllerTest do
  use DietWeb.ConnCase

  import Diet.DietsFixtures

  alias Diet.Models.ClientDiets

  @create_attrs %{
    user: "7488a646-e31f-11e4-aace-600308960662",
    foods: %{},
    total_calories: 42,
    total_protein: 120.5,
    total_carbohydrates: 120.5,
    total_fat: 120.5
  }
  @update_attrs %{
    user: "7488a646-e31f-11e4-aace-600308960668",
    foods: %{},
    total_calories: 43,
    total_protein: 456.7,
    total_carbohydrates: 456.7,
    total_fat: 456.7
  }
  @invalid_attrs %{
    user: nil,
    foods: nil,
    total_calories: nil,
    total_protein: nil,
    total_carbohydrates: nil,
    total_fat: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_foods", %{conn: conn} do
      conn = get(conn, ~p"/api/user_foods")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create client_diets" do
    @tag :skip
    test "renders client_diets when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/user_foods", client_diets: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/user_foods/#{id}")

      assert %{
               "id" => ^id,
               "foods" => %{},
               "total_calories" => 42,
               "total_carbohydrates" => 120.5,
               "total_fat" => 120.5,
               "total_protein" => 120.5,
               "user" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/user_foods", client_diets: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update client_diets" do
    setup [:create_client_diets]

    test "renders client_diets when data is valid", %{
      conn: conn,
      client_diets: %ClientDiets{id: id} = client_diets
    } do
      conn = put(conn, ~p"/api/user_foods/#{client_diets}", client_diets: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/user_foods/#{id}")

      assert %{
               "id" => ^id,
               "foods" => %{},
               "total_calories" => 43,
               "total_carbohydrates" => 456.7,
               "total_fat" => 456.7,
               "total_protein" => 456.7,
               "user" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, client_diets: client_diets} do
      conn = put(conn, ~p"/api/user_foods/#{client_diets}", client_diets: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete client_diets" do
    setup [:create_client_diets]

    test "deletes chosen client_diets", %{conn: conn, client_diets: client_diets} do
      conn = delete(conn, ~p"/api/user_foods/#{client_diets}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/user_foods/#{client_diets}")
      end
    end
  end

  defp create_client_diets(_) do
    client_diets = client_diets_fixture()
    %{client_diets: client_diets}
  end
end
