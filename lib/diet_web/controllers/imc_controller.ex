defmodule DietWeb.ImcController do
  use DietWeb, :controller

  alias Diet.Profile
  alias Diet.Profile.Imc

  action_fallback DietWeb.FallbackController

  def index(conn, _params) do
    imc = Profile.list_imc()
    render(conn, :index, imc: imc)
  end

  def create(conn, %{"data" => imc_params}) do
    with {:ok, %Imc{} = imc} <- Profile.create_imc(imc_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/imc/#{imc}")
      |> render(:show, imc: imc)
    end
  end

  def show(conn, %{"id" => id}) do
    imc = Profile.list_imc_by_user(id)
    render(conn, :index, imc: imc)
  end
end
