defmodule Backend.OrderTest do
  use Backend.ModelCase

  alias Backend.Order

  @valid_attrs %{end_dt: "2010-04-17", site_id: "some content", start_dt: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Order.changeset(%Order{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Order.changeset(%Order{}, @invalid_attrs)
    refute changeset.valid?
  end
end
