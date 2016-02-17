defmodule Di.Tracks do
  alias Di.{API, Model.Track, Model.TrackInfo}

  @doc """
  Get track info by id
  """
  def info_by_id(track_id) when is_integer(track_id) do
    API.request("/tracks/#{track_id}", %TrackInfo{})
  end

  @doc """
  Get a list of the most recent trackhistories for every channel
  """
  def now do
    API.request("/track_history", {})
    |> now_parser 
  end

  @doc """
  Get a list of most recent trackhistories for a specific channel id
  """
  def recent_by_channel_id(channel_id) when is_integer(channel_id) do
    API.request("/track_history/channel/#{channel_id}", [%Track{}])
  end

  #Track history endpoint returns an irregular JSON object with variable channel ids
  #as root keys for each Track, this method removes them so it's purely a list of tracks
  defp now_parser(response) do
    case response do
      {:ok, body} ->
        result = body
      |> Enum.map(fn({_, v}) -> {v} end)
      |> Enum.map(fn{track} -> Poison.Decode.decode(track, as: %Track{}) end)
      {:ok, result}
      _ ->
        response
    end
  end
end
