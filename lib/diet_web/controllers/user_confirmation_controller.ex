defmodule DietWeb.UserConfirmationController do
  use DietWeb, :controller
  alias Diet.Repositories.Accounts

  def edit(conn, %{"token" => token}) do
    with {:ok, _} <- Accounts.confirm_user(token) do
      conn
      |> put_status(:ok)
      |> render(:show)
    else
      _ ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "User not found"})
    end
  end
end
