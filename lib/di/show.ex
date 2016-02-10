defmodule Di.Show do
  defstruct [:id, :name, :parent_show_id, :tagline, :artists_tagline, :slug,
             :human_readable_schedule, :next_start_at, :next_end_at, :ondemand_episode_count,
             :now_playing, :channels, :images]
end
