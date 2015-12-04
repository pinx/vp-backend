defmodule Backend.ActivityTest do
  use Backend.ModelCase

  alias Backend.Activity

  @valid_attrs %{description: "some content", end_at: "2010-04-17 14:00:00", name: "some content", start_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Activity.changeset(%Activity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Activity.changeset(%Activity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
