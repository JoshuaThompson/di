defmodule Di.Channel do
  alias Di.{Request, SimilarChannel, Image}

  defstruct ad_channel: nil,
            channel_director: nil,
            created_at: nil,
            description_long: nil,
            description_short: nil,
            forum_id: nil,
            id: nil,
            key: nil,
            name: nil,
            network_id: nil,
            old_id: nil,
            premium_id: nil,
            tracklist_server_id: nil,
            updated_at: nil,
            asset_id: nil,
            asset_url: nil,
            banner_url: nil,
            description: nil,
            similar_channels: [%SimilarChannel{}],
            images: %Image{}

  def all do
    Request.get!("/channels")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{}])
  end

  def by_id(channel_id) when is_integer(channel_id) do
    Request.get!("/channels/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: %__MODULE__{})
  end
end
