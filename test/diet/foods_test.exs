defmodule Diet.FoodsTest do
  use Diet.DataCase

  alias Diet.Foods

  describe "foods" do
    alias Diet.Foods.Food

    import Diet.FoodsFixtures

    @invalid_attrs %{name: nil, calories: nil, protein: nil, carbohydrates: nil, fat: nil}

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Foods.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Foods.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{
        name: "some name",
        calories: 42,
        protein: 120.5,
        carbohydrates: 120.5,
        fat: 120.5
      }

      assert {:ok, %Food{} = food} = Foods.create_food(valid_attrs)
      assert food.name == "some name"
      assert food.calories == 42
      assert food.protein == 120.5
      assert food.carbohydrates == 120.5
      assert food.fat == 120.5
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Foods.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()

      update_attrs = %{
        name: "some updated name",
        calories: 43,
        protein: 456.7,
        carbohydrates: 456.7,
        fat: 456.7
      }

      assert {:ok, %Food{} = food} = Foods.update_food(food, update_attrs)
      assert food.name == "some updated name"
      assert food.calories == 43
      assert food.protein == 456.7
      assert food.carbohydrates == 456.7
      assert food.fat == 456.7
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Foods.update_food(food, @invalid_attrs)
      assert food == Foods.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Foods.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Foods.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Foods.change_food(food)
    end
  end
end
