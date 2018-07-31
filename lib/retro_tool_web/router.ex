defmodule RetroToolWeb.Router do
  use RetroToolWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", RetroToolWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/messages", MessageController
    resources "/retro_sessions", RetroSessionController

  end

  # Other scopes may use custom stacks.
  # scope "/api", RetroToolWeb do
  #   pipe_through :api
  # end
end
