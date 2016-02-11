defmodule Di.Track do
  alias Di.Image

  defstruct art_url: nil,
            artist: nil,
            channel_id: nil,
            duration: nil,
            images: %Image{},
            length: nil,
            network_id: nil,
            release: nil,
            started: nil,
            title: nil,
            track: nil,
            track_id: nil,
            type: nil
end
