defmodule Di.Track do
  alias Di.{Request, Image}

  defstruct [:art_url, :artist, :channel_id, :duration, :images, :length, :network_id, :release,
             :started, :title, :track, :track_id, :type]

  def now_playing do
    Request.get!("/track_history")
    |> Map.fetch!(:body)
    |> Poison.decode!
    |> Enum.map(fn({_, v}) -> {v} end) #Remove variable json key (e.g. '182')
    |> Enum.map(fn({track}) -> Poison.Decode.decode(track, as: %__MODULE__{images: %Image{}}) end)
  end

  def history_by_channel_id(channel_id) when is_integer(channel_id) do
    Request.get!("/track_history/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{images: %Image{}}])
  end
end
