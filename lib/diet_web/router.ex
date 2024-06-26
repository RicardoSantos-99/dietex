defmodule DietWeb.Router do
  use DietWeb, :router

  pipeline :api do
    plug CORSPlug

    plug :accepts, ["json"]
  end

  scope "/api", DietWeb do
    pipe_through :api

    resources "/foods", FoodController, except: [:new, :edit]
    resources "/user_foods", ClientDietsController, except: [:new, :edit]
    resources "/imc", ImcController, only: [:index, :create, :show]
    options "/foods", FoodController, :options
    options "/user_foods", ClientDietsController, :options
    options "/imc", ImcController, :options
    post "/users/register", UserRegistrationController, :create
    put "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/log_in", UserLoginController, :create
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:diet, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: DietWeb.Telemetry
    end
  end
end
