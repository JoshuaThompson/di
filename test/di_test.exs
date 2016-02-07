defmodule DiTest do
  use ExUnit.Case
  doctest Di

  test "the truth" do
    assert test_channel(182) == 182
  end

  defp test_channel(id) do
    Di.Channels.get_channel!(id)
    |> Map.fetch!("id")
  end
end
