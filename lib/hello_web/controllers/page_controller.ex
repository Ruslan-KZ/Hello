defmodule HelloWeb.PageController do
  use HelloWeb, :controller
require Logger
  def index(conn, _params) do
Logger.error("""
iudfhgijo; h foih
Lorem Lorem LoremLoremLoremLorem Lorem
Lorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem Lorem
Lorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem Lorem
Lorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem Lorem
Lorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem LoremLorem Lorem LoremLoremLoremLorem Lorem
""")
    render(conn, "index.html")
  end
end
