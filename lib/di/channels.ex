defmodule Di.Channels do
  alias Di.{Request, Image}

  defmodule Channel do
    defstruct [:ad_channel, :channel_director, :created_at, :description_long, :description_short,
               :forum_id, :id, :key, :name, :network_id, :old_id, :premium_id, :tracklist_server_id,
               :updated_at, :asset_id, :asset_url, :banner_url, :description, :similar_channels,
               :images]
  end

  defmodule SimilarChannel do
    defstruct [:id, :similar_channel_id]
  end

  def all do
    Request.get!("/channels")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%Channel{similar_channels: [%SimilarChannel{}], images: %Image{}}])
  end

  def by_id(channel_id) when is_integer(channel_id) do
    Request.get!("/channels/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: %Channel{similar_channels: [%SimilarChannel{}], images: %Image{}})
  end
end
