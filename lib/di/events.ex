defmodule Di.Events do
  alias Di.{Request, Image}

  defmodule Event do
    defstruct [:duration, :id, :name, :show_id, :slug, :start_at, :subtitle,
               :end_at, :artists_tagline, :show]
  end

  defmodule Show do
    defstruct [:id, :name, :parent_show_id, :tagline, :artists_tagline, :slug,
               :human_readable_schedule, :next_start_at, :next_end_at, :ondemand_episode_count,
               :now_playing, :channels, :images]
  end

  defmodule Channel do
    defstruct [:description_long, :description_short, :id, :key, :name, :description, :images]
  end

  def upcoming do
    Request.get!("/events")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%Event{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end

  def upcoming(channel_id) when is_integer(channel_id) do
    Request.get!("/events/channel/#{channel_id}")
    |> Map.fetch!(:body)
    |> Poison.decode!(as: [%Event{show: %Show{channels: [%Channel{images: %Image{}}], images: %Image{}}}])
  end
end
