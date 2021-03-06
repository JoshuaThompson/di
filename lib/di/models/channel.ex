defmodule Di.Model.Channel do
  alias Di.Model.{SimilarChannel, Image}

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
end
