defmodule Di.Event do
  alias Di.{Request, Show, Channel, Image}

  defstruct [:duration, :id, :name, :show_id, :slug, :start_at, :subtitle,
             :end_at, :artists_tagline, :show]

  def all do
    Request.get!("/events")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end

  def all_by_channel_id(channel_id) when is_integer(channel_id) do
    Request.get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end
end
