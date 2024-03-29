defmodule DietWeb.UserConfirmationJSON do
  @doc """
  Renders a single user into JSON.
  """
  def show(_) do
    %{data: "User confirmed"}
  end
end
