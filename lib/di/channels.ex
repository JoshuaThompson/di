defmodule Di.Channels do
  import Di

  alias Di.Channel
  alias Di.SimilarChannel
  alias Di.Image

  def all do
    get!("/channels")
    |> Map.fetch!(:body)
    |> decode_json!([%Channel{similar_channels: [%SimilarChannel{}], images: %Image{}}])
  end

  def one(channel_id) when is_integer(channel_id) do
    get!("/channels/#{channel_id}")
    |> Map.fetch!(:body)
    |> decode_json!(%Channel{similar_channels: [%SimilarChannel{}], images: %Image{}})
  end
end
