defmodule Di.Channels do
  alias Di.{API, Model.Channel}

  @doc """
  Get a specific channel by id
  """
  def by_id(channel_id) when is_integer(channel_id) do
    API.request("/channels/#{channel_id}", %Channel{})
  end

  @doc """
  Get a list of channels
  """
  def all do
    API.request("/channels", [%Channel{}])
  end
end
