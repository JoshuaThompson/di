defmodule Exdi.Channels do
  use HTTPoison.Base

  alias Exdi.Response

  defp process_url(endpoint) do
    "http://listen.di.fm" <> endpoint
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!()
  end

  def get_channels(streamlist) when is_bitstring(streamlist) do
    get("/#{streamlist}")
    |> Response.handle_response()
  end
end
