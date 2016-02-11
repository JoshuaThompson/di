defmodule Di.Show do
  alias Di.{Channel, Image}

  defstruct id: nil,
            name: nil,
            parent_show_id: nil,
            tagline: nil,
            artists_tagline: nil,
            slug: nil,
            human_readable_schedule: nil,
            next_start_at: nil,
            next_end_at: nil,
            ondemand_episode_count: nil,
            now_playing: nil,
            channels: [%Channel{}],
            images: %Image{}
end
