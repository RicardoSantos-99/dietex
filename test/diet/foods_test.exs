defmodule Diet.FoodsTest do
  use Diet.DataCase

  import Diet.Factory

  alias Diet.Foods
  alias Diet.Foods.Food

  describe "foods" do
    test "list_foods/0 returns all foods" do
      food = insert!(:food)
      assert Foods.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = insert!(:food)
      assert Foods.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = params_for(:food, [], key_type: :atom_keys)

      assert {:ok, %Food{} = food} = Foods.create_food(valid_attrs)
      assert food.name == valid_attrs.name
      assert food.calories == valid_attrs.calories
      assert food.protein == valid_attrs.protein
      assert food.carbohydrates == valid_attrs.carbohydrates
      assert food.fat == valid_attrs.fat
    end

    test "create_food/1 with invalid data returns error changeset" do
      invalid_attrs = params_for(:food, [name: nil], key_type: :atom_keys)
      assert {:error, %Ecto.Changeset{}} = Foods.create_food(invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = insert!(:food)

      update_attrs =
        params_for(
          :food,
          [
            name: "some updated name",
            calories: 43,
            protein: 456.7,
            carbohydrates: 456.7,
            fat: 456.7
          ],
          key_type: :atom_keys
        )

      assert {:ok, %Food{} = food} = Foods.update_food(food, update_attrs)
      assert food.name == "some updated name"
      assert food.calories == 43
      assert food.protein == 456.7
      assert food.carbohydrates == 456.7
      assert food.fat == 456.7
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = insert!(:food)
      invalid_attrs = params_for(:food, [name: nil], key_type: :atom_keys)

      assert {:error, %Ecto.Changeset{}} = Foods.update_food(food, invalid_attrs)
      assert food == Foods.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = insert!(:food)
      assert {:ok, %Food{}} = Foods.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Foods.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = insert!(:food)
      assert %Ecto.Changeset{} = Foods.change_food(food)
    end
  end
end
