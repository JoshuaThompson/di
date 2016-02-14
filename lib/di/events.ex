defmodule Di.Events do
  alias Di.{API, Model.Event}

  @doc """
  Get a list of upcoming events by channel id
  """
  def by_id(channel_id) when is_integer(channel_id) do
    API.request("/events/channel/#{channel_id}", [%Event{}])
  end

  @doc """
  Get a list of upcoming events
  """
  def all do
    API.request("/events", [%Event{}])
  end
end
