defmodule Di do
  use HTTPoison.Base

  alias Di.{Track, Event, Channel, Error}

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  def channels do
    get("/channels")
    |> handle_response([%Channel{}])
  end

  def channel(channel_id) when is_integer(channel_id) do
    get("/channels/#{channel_id}")
    |> handle_response(%Channel{})
  end

  def events do
    get("/events")
    |> handle_response([%Event{}])
  end

  def events(channel_id) when is_integer(channel_id) do
    get("/events/channel/#{channel_id}")
    |> handle_response([%Event{}])
  end

  def track_history_by_channel_id(channel_id) when is_integer(channel_id) do
    get("/track_history")
    |> handle_response([%Track{}])
  end

  def now_playing do
    case handle_response(get("/track_history"), %{}) do
      {:ok, body} ->
        result = Enum.map(body, fn({_, v}) -> {v} end)
                 |> Enum.map(fn({track}) -> Poison.Decode.decode(track, as: %Track{}) end)
        {:ok, result}
      {:error, reason} ->
        {:error, reason}
    end
  end

  defp handle_response(response, struct) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body, as: struct)}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, %Error{code: 404, reason: "404 Not Found"}}
      {:ok, %HTTPoison.Response{status_code: 429}} ->
        {:error, %Error{code: 429, reason: "429 Too Many Requests"}}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %Error{code: nil, reason: reason}}
    end
  end
end
