defmodule Di do
  use HTTPoison.Base

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end
end
