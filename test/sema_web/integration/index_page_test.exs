defmodule SemaWeb.IndexPageTest do
  use SemaWeb.IntegrationCase, async: true
  import Wallaby.Query

  test "index page has a welcome message", %{session: session} do
    session
    |> visit("/")
    |> find(css("section.phx-hero"))
    |> assert_has(css("h1", text: "Welcome to Phoenix!"))
  end
end
