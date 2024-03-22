defmodule Diet.DietsTest do
  use Diet.DataCase

  alias Diet.Diets

  describe "user_foods" do
    alias Diet.Diets.ClientDiets

    import Diet.DietsFixtures

    @invalid_attrs %{user: nil, foods: nil, total_calories: nil, total_protein: nil, total_carbohydrates: nil, total_fat: nil}

    test "list_user_foods/0 returns all user_foods" do
      client_diets = client_diets_fixture()
      assert Diets.list_user_foods() == [client_diets]
    end

    test "get_client_diets!/1 returns the client_diets with given id" do
      client_diets = client_diets_fixture()
      assert Diets.get_client_diets!(client_diets.id) == client_diets
    end

    test "create_client_diets/1 with valid data creates a client_diets" do
      valid_attrs = %{user: "7488a646-e31f-11e4-aace-600308960662", foods: %{}, total_calories: 42, total_protein: 120.5, total_carbohydrates: 120.5, total_fat: 120.5}

      assert {:ok, %ClientDiets{} = client_diets} = Diets.create_client_diets(valid_attrs)
      assert client_diets.user == "7488a646-e31f-11e4-aace-600308960662"
      assert client_diets.foods == %{}
      assert client_diets.total_calories == 42
      assert client_diets.total_protein == 120.5
      assert client_diets.total_carbohydrates == 120.5
      assert client_diets.total_fat == 120.5
    end

    test "create_client_diets/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Diets.create_client_diets(@invalid_attrs)
    end

    test "update_client_diets/2 with valid data updates the client_diets" do
      client_diets = client_diets_fixture()
      update_attrs = %{user: "7488a646-e31f-11e4-aace-600308960668", foods: %{}, total_calories: 43, total_protein: 456.7, total_carbohydrates: 456.7, total_fat: 456.7}

      assert {:ok, %ClientDiets{} = client_diets} = Diets.update_client_diets(client_diets, update_attrs)
      assert client_diets.user == "7488a646-e31f-11e4-aace-600308960668"
      assert client_diets.foods == %{}
      assert client_diets.total_calories == 43
      assert client_diets.total_protein == 456.7
      assert client_diets.total_carbohydrates == 456.7
      assert client_diets.total_fat == 456.7
    end

    test "update_client_diets/2 with invalid data returns error changeset" do
      client_diets = client_diets_fixture()
      assert {:error, %Ecto.Changeset{}} = Diets.update_client_diets(client_diets, @invalid_attrs)
      assert client_diets == Diets.get_client_diets!(client_diets.id)
    end

    test "delete_client_diets/1 deletes the client_diets" do
      client_diets = client_diets_fixture()
      assert {:ok, %ClientDiets{}} = Diets.delete_client_diets(client_diets)
      assert_raise Ecto.NoResultsError, fn -> Diets.get_client_diets!(client_diets.id) end
    end

    test "change_client_diets/1 returns a client_diets changeset" do
      client_diets = client_diets_fixture()
      assert %Ecto.Changeset{} = Diets.change_client_diets(client_diets)
    end
  end
end
