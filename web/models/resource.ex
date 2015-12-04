defmodule Backend.Resource do
  use Backend.Web, :model

  schema "resources" do
    field :name, :string
    field :description, :string
    field :available_from, Ecto.DateTime
    field :available_to, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(name description available_from available_to)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
