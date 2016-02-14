defmodule Di.Channels do
  import Di.API
  alias Di.Model.{Channel, Track}

  def by_id(channel_id) when is_integer(channel_id) do
    get("/channels/#{channel_id}")
    |> handle_response(%Channel{})
  end

  def track_history_by_id(channel_id) when is_integer(channel_id) do
    get("/track_history/channel/#{channel_id}")
    |> handle_response([%Track{}])
  end

  def all do
    get("/channels")
    |> handle_response([%Channel{}])
  end
end
