defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  defmodule Example do
    def get_cliente_com_foto(id) do
      data = Poison.encode!(%{ "zparam" => id, "tipo" => "0" })
      HTTPotion.post "bemol:PyRV8uTDkfjS3aUL@180.200.3.18:4567/sap/ZRFC_GET_CLIENTECOMFOTO", [body: data, headers: ["Content-Type": "application/json"]]
    end
  end

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end


    def teste(conn, _params) do
      id = 1239220
      p1 = spawn  Example, :get_cliente_com_foto, [id]
      p2 = spawn  Example, :get_cliente_com_foto, [id]
      p3 = spawn  Example, :get_cliente_com_foto, [id]
      p4 = spawn  Example, :get_cliente_com_foto, [id]
      p5 = spawn  Example, :get_cliente_com_foto, [id]
      #IO.puts Kernel.inspect(response)
      #IO.puts Kernel.inspect p1
      json conn, "{}"
    end
end

