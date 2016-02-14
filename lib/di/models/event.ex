defmodule Di.Model.Event do
  alias Di.Model.Show

  defstruct duration: nil,
            id: nil,
            name: nil,
            show_id: nil,
            slug: nil,
            start_at: nil,
            subtitle: nil,
            end_at: nil,
            artists_tagline: nil,
            show: %Show{}
end
