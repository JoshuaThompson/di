defmodule Di.Events do
  import Di.API
  alias Di.Model.Event

  def by_id(channel_id) when is_integer(channel_id) do
    get("/events/channel/#{channel_id}")
    |> handle_response([%Event{}])
  end

  def all do
    get("/events")
    |> handle_response([%Event{}])
  end
end
