defmodule Backend.OrderView do
  use Backend.Web, :view

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, Backend.OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, Backend.OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      site_id: order.site_id,
      start_dt: order.start_dt,
      end_dt: order.end_dt}
  end
end
