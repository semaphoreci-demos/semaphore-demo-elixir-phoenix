defmodule SemaWeb.Router do
  use SemaWeb, :router

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

  scope "/", SemaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/posts", PostController
  end

  scope "/cms", SemaWeb.CMS, as: :cms do
    pipe_through :browser

    resources "/pages", PageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SemaWeb do
  #   pipe_through :api
  # end
end
