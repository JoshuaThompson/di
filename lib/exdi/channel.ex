defmodule Exdi.Channel do

  def get_channels! do
    Exdi.get!("/channels")
    |> Map.fetch!(:body)
  end

  def get_channel!(channel_id) when is_integer(channel_id) do
    Exdi.get!("/channels/#{channel_id}")
    |> Map.fetch!(:body)
  end
end
