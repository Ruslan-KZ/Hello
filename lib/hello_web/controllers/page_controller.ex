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
end
