defmodule Di.Tracks do
  import Di.API
  alias Di.Model.Track

  def history(channel_id) when is_integer(channel_id) do
    get("/track_history/channel/#{channel_id}")
    |> handle_response([%Track{}])
  end

  def now do
    get("/track_history")
    |> handle_response
    |> now_parser
  end

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
