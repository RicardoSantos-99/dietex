defmodule Diet.ProfileFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Diet.Profile` context.
  """

  @doc """
  Generate a imc.
  """
  def imc_fixture(attrs \\ %{}) do
    {:ok, imc} =
      attrs
      |> Enum.into(%{
        age: 42,
        height: 120.5,
        user: "some user",
        weight: 120.5
      })
      |> Diet.Profile.create_imc()

    imc
  end
end
