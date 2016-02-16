defmodule Di.TrackHistories do
  alias Di.{API, Model.TrackHistory}

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
  def by_channel_id(channel_id) when is_integer(channel_id) do
    API.request("/track_history/channel/#{channel_id}", [%TrackHistory{}])
  end

  #Track history endpoint returns an irregular JSON object with variable channel ids
  #as root keys for each Track, this method removes them so it's purely a list of tracks
  defp now_parser(response) do
    case response do
      {:ok, body} ->
        result = body
      |> Enum.map(fn({_, v}) -> {v} end)
      |> Enum.map(fn{track} -> Poison.Decode.decode(track, as: %TrackHistory{}) end)
      {:ok, result}
      _ ->
        response
    end
  end
end
