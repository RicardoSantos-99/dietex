defmodule DietWeb.UserRegistrationController do
  use DietWeb, :controller

  alias Diet.Repo
  alias Diet.Models.User
  alias Diet.Models.UserToken
  alias Diet.Repositories.Accounts

  action_fallback DietWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.register_user(user_params),
         {encode_token, user_token} <- UserToken.build_email_token(user, "confirm"),
         {:ok, _} <- Repo.insert(user_token) do
      conn
      |> put_status(:created)
      |> render(:show, user: user, token: encode_token)
    end
  end
end
