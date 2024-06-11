defmodule DietWeb.ImcJSON do
  alias Diet.Profile.Imc

  @doc """
  Renders a list of imc.
  """
  def index(%{imc: imc}) do
    %{data: for(imc <- imc, do: data(imc))}
  end

  @doc """
  Renders a single imc.
  """
  def show(%{imc: imc}) do
    %{data: data(imc)}
  end

  defp data(%Imc{} = imc) do
    %{
      id: imc.id,
      age: imc.age,
      height: imc.height,
      weight: imc.weight,
      user: imc.user,
      insert_at: imc.inserted_at
    }
  end
end
