defmodule Exdi.Events do
  use HTTPoison.Base

  alias Exdi.Response

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!()
  end

  def get_upcoming_events() do
    get("/events")
    |> Response.handle_response()
  end

  def get_upcoming_events(channel_id) when is_integer(channel_id) do
    get("/events/channel/#{channel_id}")
    |> Response.handle_response()
  end
end
