# defmodule HelloWeb.PageController do
#   use HelloWeb, :controller
# require Logger
#   def index(conn, _params) do
# Logger.error("""
# Ошибки
# """)
#     render(conn, "index.html")
#   end
# end

defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # http://localhost:4000/about/some_location?company=SomeCompany
  def about(conn, %{"location" => location} = params) do
    company = Map.get(params, "company", "unknown")
    render(conn, "about.html", company: company, location: location)
  end
end
