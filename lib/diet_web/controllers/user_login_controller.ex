defmodule DietWeb.UserLoginController do
  use DietWeb, :controller

  alias Diet.Repositories.Accounts
  alias DietWeb.UserRegistrationJSON

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    with {:ok, user_params} <- Accounts.get_user_by_email_and_password(email, password),
         {:ok, token} <- Accounts.generate_user_session_token(user_params) do
      conn
      |> put_status(:ok)
      |> put_view(UserRegistrationJSON)
      |> render(:show, user: user_params, token: Base.encode64(token))
    else
      _ ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid email or password"})
    end
  end
end
