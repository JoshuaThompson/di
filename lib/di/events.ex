defmodule Di.Events do
  import Di

  alias Di.Event
  alias Di.Show
  alias Di.Image
  alias Di.Channel

  def get_upcoming_events do
    get!("/events")
    |> Map.fetch!(:body)
    |> decode_json!([%Event{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end

  def get_upcoming_events!(channel_id) when is_integer(channel_id) do
    get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> decode_json!([%Event{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end
end
