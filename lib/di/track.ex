defmodule Di.Track do
  alias Di.{Request, Image}

  defstruct art_url: nil,
            artist: nil,
            channel_id: nil,
            duration: nil,
            images: %Image{},
            length: nil,
            network_id: nil,
            release: nil,
            started: nil,
            title: nil,
            track: nil,
            track_id: nil,
            type: nil

  def now_playing do
    Request.get!("/track_history")
    |> Map.fetch!(:body)
    |> Poison.decode!
    |> Enum.map(fn({_, v}) -> {v} end) #Remove variable json key (e.g. '182')
    |> Enum.map(fn({track}) -> Poison.Decode.decode(track, as: %__MODULE__{}) end)
  end

  def history_by_channel_id(channel_id) when is_integer(channel_id) do
    Request.get!("/track_history/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%__MODULE__{}])
  end
end
