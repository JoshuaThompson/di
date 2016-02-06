defmodule Di.Events do
  import Di

  def get_upcoming_events! do
    get!("/events")
    |> Map.fetch!(:body)
  end

  def get_upcoming_events do
    get("/events")
  end

  def get_upcoming_events!(channel_id) when is_integer(channel_id) do
    get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
  end

  def get_upcoming_events(channel_id) when is_integer(channel_id) do
    get("/events/channel/#{channel_id}")
  end
end
