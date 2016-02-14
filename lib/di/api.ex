defmodule Di.API do
  use HTTPoison.Base
  alias Di.Model.Error

  @doc """
  Make a request to the di.fm API and optionally convert result to a struct
  """
  def request(endpoint, opts \\ {}) do
    get(endpoint)
    |> handle_response(opts)
  end

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  defp handle_response(response, opts) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body, as: opts)}
      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, %Error{code: code, reason: "Status code: #{code}"}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %Error{code: nil, reason: reason}}
    end
  end
end
