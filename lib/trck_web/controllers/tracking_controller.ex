defmodule TrckWeb.TrackingController do
  use TrckWeb, :controller

  def new(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id} ) do
    render(conn, "tracking_detail.html", trck_num: id)
  end

  def create(conn, %{"trck_num" => trck_num}) do
    conn
    |> put_flash(:info, "El paquete fue encontrado satisfactoriamente!")
    |> redirect(to: Routes.tracking_path(conn, :show, trck_num))
  end
end
