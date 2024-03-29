defmodule Diet.Factory do
  alias Diet.Repo

  use Diet.Factory.Models.FoodFactory
  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  @spec insert!(atom(), map() | keyword()) :: Ecto.Schema.t()
  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end

  @spec params_for(atom(), map() | keyword(), keyword()) :: map()
  def params_for(factory_name, attributes \\ [], opts \\ []) do
    key_type = Keyword.get(opts, :key_type, :string_keys)

    factory_name
    |> build()
    |> struct!(attributes)
    |> Map.drop([:__meta__, :__struct__])
    |> to_map(key_type: key_type)
  end

  @spec many_params!(integer(), any(), any(), any()) :: list()
  def many_params!(count, factory_name, attributes \\ [], opts \\ []) do
    Enum.map(1..count, fn _ -> params_for(factory_name, attributes, opts) end)
  end

  @spec insert_list!(pos_integer(), atom(), map() | keyword()) :: [Ecto.Schema.t()]
  @spec insert_list!(pos_integer(), atom()) :: [%{optional(atom()) => any()}]
  def insert_list!(count, factory_name, attributes \\ []) do
    Enum.map(1..count, fn _ -> insert!(factory_name, attributes) end)
  end

  defp to_map(map, key_type: :string_keys), do: transform_keys(map, &to_string/1)
  defp to_map(map, key_type: :atom_keys), do: map

  defp transform_keys(map, fun) do
    Enum.reduce(map, %{}, fn {k, v}, acc -> Map.put(acc, fun.(k), v) end)
  end
end
