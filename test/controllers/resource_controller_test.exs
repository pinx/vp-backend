defmodule Backend.ResourceControllerTest do
  use Backend.ConnCase

  alias Backend.Resource
  @valid_attrs %{available_from: "2010-04-17 14:00:00", available_to: "2010-04-17 14:00:00", description: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, resource_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = get conn, resource_path(conn, :show, resource)
    assert json_response(conn, 200)["data"] == %{"id" => resource.id,
      "name" => resource.name,
      "description" => resource.description,
      "available_from" => resource.available_from,
      "available_to" => resource.available_to}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, resource_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, resource_path(conn, :create), resource: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Resource, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, resource_path(conn, :create), resource: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = put conn, resource_path(conn, :update, resource), resource: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Resource, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = put conn, resource_path(conn, :update, resource), resource: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = delete conn, resource_path(conn, :delete, resource)
    assert response(conn, 204)
    refute Repo.get(Resource, resource.id)
  end
end
