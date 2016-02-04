defmodule Exdi.Tracks do
  use HTTPoison.Base

  alias Exdi.Response

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!()
  end

  def get_currently_playing() do
    get("/track_history")
    |> Response.handle_response()
  end

  def get_currently_playing(channel_id) when is_integer(channel_id) do
    get("/track_history/channel/#{channel_id}")
    |> Response.handle_response()
  end
end
