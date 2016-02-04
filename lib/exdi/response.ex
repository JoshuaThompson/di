defmodule Exdi.Response do

  def handle_response(response) do
    case (response) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 204}} ->
        {:ok}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, 404}
      {:ok, %HTTPoison.Response{status_code: 429}} ->
        {:error, 429}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
