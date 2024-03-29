defmodule Diet.Factory.Models.FoodFactory do
  @moduledoc false

  alias Diet.Foods.Food

  defmacro __using__(_opts) do
    quote do
      def build(:food) do
        %Food{
          id: Ecto.UUID.generate(),
          name: "apple",
          calories: 52,
          protein: 0.3,
          carbohydrates: 1.4,
          fat: 0.2,
          inserted_at: DateTime.utc_now() |> DateTime.truncate(:second),
          updated_at: DateTime.utc_now() |> DateTime.truncate(:second)
        }
      end
    end
  end
end
