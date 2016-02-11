defmodule Di.Event do
  alias Di.{Request, Show}

  defstruct duration: nil,
            id: nil,
            name: nil,
            show_id: nil,
            slug: nil,
            start_at: nil,
            subtitle: nil,
            end_at: nil,
            artists_tagline: nil,
            show: %Show{}

  def all do
    Request.get!("/events")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{}])
  end

  def all_by_channel_id(channel_id) when is_integer(channel_id) do
    Request.get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{}])
  end
end
