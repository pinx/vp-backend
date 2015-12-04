defmodule Backend.ActivityView do
  use Backend.Web, :view

  def render("index.json", %{activities: activities}) do
    %{data: render_many(activities, Backend.ActivityView, "activity.json")}
  end

  def render("show.json", %{activity: activity}) do
    %{data: render_one(activity, Backend.ActivityView, "activity.json")}
  end

  def render("activity.json", %{activity: activity}) do
    %{id: activity.id,
      name: activity.name,
      description: activity.description,
      start_at: activity.start_at,
      end_at: activity.end_at}
  end
end
