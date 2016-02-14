defmodule Di.Tracks do
  alias Di.{API, Model.Track}

  @doc """
  Get a list of currently playing tracks for every channel
  """
  def now do
    API.request("/track_history", {})
    |> now_parser 
  end

  @doc """
  Get a list of recently played tracks for a specific channel id
  """
  def history_by_channel_id(channel_id) when is_integer(channel_id) do
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
