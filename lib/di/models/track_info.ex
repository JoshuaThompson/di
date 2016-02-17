defmodule Di.Model.TrackInfo do
  alias Di.Model.{Artist, Image, VoteInfo}

  defstruct artist: %Artist{},
  artists: [%Artist{}],
  asset_url: nil,
  content: nil,
  content_accessibility: nil,
  details_url: nil,
  display_artist: nil,
  id: nil,
  images: %Image{},
  isrc: nil,
  length: nil,
  mix: nil,
  parental_advisory: nil,
  release: nil,
  retail: nil,
  retail_accessibility: nil,
  title: nil,
  track: nil,
  version: nil,
  votes: %VoteInfo{}
end
