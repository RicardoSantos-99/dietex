# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Diet.Repo.insert!(%Diet.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Insert some data into the foods table

alias Diet.Foods.Food

foods = [
  %{name: "Apple", calories: 95, protein: 0.5, carbohydrates: 25, fat: 0.3},
  %{name: "Banana", calories: 105, protein: 1.3, carbohydrates: 27, fat: 0.4},
  %{name: "Orange", calories: 62, protein: 1.2, carbohydrates: 15, fat: 0.2},
  %{name: "Pineapple", calories: 50, protein: 0.5, carbohydrates: 13, fat: 0.1},
  %{name: "Strawberry", calories: 50, protein: 0.8, carbohydrates: 11, fat: 0.4},
  %{name: "Blueberry", calories: 57, protein: 0.7, carbohydrates: 14, fat: 0.3},
  %{name: "Raspberry", calories: 64, protein: 1.5, carbohydrates: 14, fat: 0.7},
  %{name: "Blackberry", calories: 43, protein: 2, carbohydrates: 10, fat: 0.5},
  %{name: "Grape", calories: 69, protein: 0.6, carbohydrates: 18, fat: 0.2},
  %{name: "Watermelon", calories: 30, protein: 0.6, carbohydrates: 8, fat: 0.2},
  %{name: "Cantaloupe", calories: 34, protein: 0.8, carbohydrates: 8, fat: 0.2},
  %{name: "Honeydew", calories: 64, protein: 0.8, carbohydrates: 16, fat: 0.2},
  %{name: "Peach", calories: 59, protein: 1.4, carbohydrates: 15, fat: 0.4},
  %{name: "Pear", calories: 57, protein: 0.4, carbohydrates: 15, fat: 0.1},
  %{name: "Plum", calories: 30, protein: 0.6, carbohydrates: 8, fat: 0.2},
  %{name: "Cherry", calories: 50, protein: 1, carbohydrates: 12, fat: 0.3},
  %{name: "Apricot", calories: 48, protein: 1.4, carbohydrates: 12, fat: 0.4},
  %{name: "Pineapple", calories: 50, protein: 0.5, carbohydrates: 13, fat: 0.1},
  %{name: "Mango", calories: 60, protein: 0.8, carbohydrates: 15, fat: 0.4},
  %{name: "Kiwi", calories: 61, protein: 1.1, carbohydrates: 15, fat: 0.5},
  %{name: "Lemon", calories: 29, protein: 1.1, carbohydrates: 9, fat: 0.3},
  %{name: "Lime", calories: 30, protein: 0.7, carbohydrates: 10, fat: 0.2},
  %{name: "Grapefruit", calories: 52, protein: 1, carbohydrates: 13, fat: 0.2},
  %{name: "Avocado", calories: 160, protein: 2, carbohydrates: 9, fat: 15},
  %{name: "Tomato", calories: 22, protein: 1, carbohydrates: 5, fat: 0.2},
  %{name: "Cucumber", calories: 16, protein: 0.7, carbohydrates: 4, fat: 0.2},
  %{name: "Bell Pepper", calories: 31, protein: 1.3, carbohydrates: 6, fat: 0.3},
  %{name: "Carrot", calories: 41, protein: 0.9, carbohydrates: 10, fat: 0.2},
  %{name: "Celery", calories: 6, protein: 0.3, carbohydrates: 1, fat: 0.1}
]

Enum.each(foods, &Foods.create_food/1)
