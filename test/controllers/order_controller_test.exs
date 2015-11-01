defmodule Backend.OrderControllerTest do
  use Backend.ConnCase

  alias Backend.Order
  @valid_attrs %{end_dt: "2010-04-17", site_id: "some content", start_dt: "2010-04-17"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, order_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    order = Repo.insert! %Order{}
    conn = get conn, order_path(conn, :show, order)
    assert json_response(conn, 200)["data"] == %{"id" => order.id,
      "site_id" => order.site_id,
      "start_dt" => order.start_dt,
      "end_dt" => order.end_dt}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, order_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, order_path(conn, :create), order: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Order, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, order_path(conn, :create), order: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    order = Repo.insert! %Order{}
    conn = put conn, order_path(conn, :update, order), order: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Order, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    order = Repo.insert! %Order{}
    conn = put conn, order_path(conn, :update, order), order: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    order = Repo.insert! %Order{}
    conn = delete conn, order_path(conn, :delete, order)
    assert response(conn, 204)
    refute Repo.get(Order, order.id)
  end
end
