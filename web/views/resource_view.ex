defmodule Backend.ResourceView do
  use Backend.Web, :view

  def render("index.json", %{resources: resources}) do
    %{data: render_many(resources, Backend.ResourceView, "resource.json")}
  end

  def render("show.json", %{resource: resource}) do
    %{data: render_one(resource, Backend.ResourceView, "resource.json")}
  end

  def render("resource.json", %{resource: resource}) do
    %{id: resource.id,
      name: resource.name,
      description: resource.description,
      available_from: resource.available_from,
      available_to: resource.available_to}
  end
end
