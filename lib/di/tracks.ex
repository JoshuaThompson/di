defmodule Di.Tracks do
  alias Di.{API, Model.Track}

  @doc """
  Get a track by id
  """
  def by_id(track_id) when is_integer(track_id) do
    API.request("/tracks/#{track_id}", %Track{})
  end
end
