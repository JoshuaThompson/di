defmodule Exdi.Channel do
  use HTTPoison.Base

  alias Exdi.Response

  defp process_url(endpoint) do
    "http://listen.di.fm/" <> endpoint
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  def get_channels() do
    get("di")
    |> Response.handle_response
  end

end
