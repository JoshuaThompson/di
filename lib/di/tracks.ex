defmodule Di.Tracks do
  import Di

  def get_track_history! do
    get!("/track_history")
    |> Map.fetch!(:body)
  end

  def get_track_history do
   get("/track_history")
  end

  def get_track_history!(channel_id) when is_integer(channel_id) do
    get!("/track_history/channel/#{channel_id}")
    |> Map.fetch!(:body)
  end

  def get_track_history(channel_id) when is_integer(channel_id) do
    get("/track_history/channel/#{channel_id}")
  end
end
