defmodule Di.Model.Artist do
  alias Di.Model.Image

  defstruct asset_url: nil,
            id: nil,
            images: %Image{},
            name: nil,
            slug: nil
end
