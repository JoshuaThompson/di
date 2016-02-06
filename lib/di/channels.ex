defmodule Di.Channels do
  import Di

  def get_channels! do
    get!("/channels")
    |> Map.fetch!(:body)
  end

  def get_channels do
    get("/channels")
  end

  def get_channel!(channel_id) when is_integer(channel_id) do
    get!("/channels/#{channel_id}")
    |> Map.fetch!(:body)
  end

  def get_channel(channel_id) when is_integer(channel_id) do
    get("/channels/#{channel_id}")
  end
end
