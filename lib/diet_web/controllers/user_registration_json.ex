defmodule DietWeb.UserRegistrationJSON do
  alias Diet.Models.User

  @doc """
  Renders a single user into JSON.
  """
  def show(%{user: user, token: token}) do
    %{data: data(user, token)}
  end

  defp data(%User{} = user, token) do
    %{
      id: user.id,
      email: user.email,
      password_confirmation: user.hashed_password,
      token: token
    }
  end
end
