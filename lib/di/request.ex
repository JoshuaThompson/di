defmodule Di.Request do
  use HTTPoison.Base

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end
end
