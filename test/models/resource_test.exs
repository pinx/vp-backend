defmodule Backend.ResourceTest do
  use Backend.ModelCase

  alias Backend.Resource

  @valid_attrs %{available_from: "2010-04-17 14:00:00", available_to: "2010-04-17 14:00:00", description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Resource.changeset(%Resource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Resource.changeset(%Resource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
