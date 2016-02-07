defmodule Di do
  use HTTPoison.Base

  defp process_url(endpoint) do
    "http://api.audioaddict.com/v1/di" <> endpoint
  end

  def decode_json!(body, struct) do
    Poison.decode!(body, as: struct)
  end

  def decode_json!(body) do
    Poison.decode!(body)
  end

  def convert_to_atom_map(map) do
    map
    |> Enum.map(fn{k,v} -> {String.to_atom(k), v} end)
  end
end
 
