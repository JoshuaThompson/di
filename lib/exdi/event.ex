defmodule Exdi.Event do

  def get_upcoming_events! do
    Exdi.get!("/events")
    |> Map.fetch!(:body)
  end

  def get_upcoming_events!(channel_id) when is_integer(channel_id) do
    Exdi.get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
  end
end
