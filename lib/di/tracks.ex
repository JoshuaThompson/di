defmodule Di.Tracks do
  import Di

  alias Di.Track
  alias Di.Image

  def all do
    get!("/track_history")
    |> Map.fetch!(:body)
    |> decode_json!
    |> Enum.map(fn{_, v} -> {v} end)
    |> Enum.map(fn{track} ->
      track
      |> Map.keys
      |> Enum.reduce(%Track{}, fn(key, acc) ->
        val = Map.get(track, key)
        case key do
          "images" ->
            put_in(acc.images, struct(%Image{}, convert_to_atom_map(val)))
          _ ->
            Map.put(acc, String.to_atom(key), val)
        end
      end)
    end)
  end

  def one(channel_id) when is_integer(channel_id) do
    get!("/track_history/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> decode_json!([%Track{images: %Image{}}])
  end
end
