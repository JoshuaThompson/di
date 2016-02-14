defmodule Di.API do
  use HTTPoison.Base
  alias Di.Model.Error

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  def handle_response(response, struct \\ %{}) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body, as: struct)}
      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, %Error{code: code, reason: "Status code: #{code}"}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %Error{code: nil, reason: reason}}
    end
  end
end
