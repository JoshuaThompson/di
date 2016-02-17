defmodule DiTest do
  use ExUnit.Case
  doctest Di

  test "get specific channel" do
    {:ok, result} = Di.Channels.by_id(1)
    assert result.name == "Trance"
  end

  test "get non-existent channel" do
    {:error, reason} = Di.Channels.by_id(-1)
    assert reason.code == 404
  end

  test "get all channels" do
    {:ok, result} = Di.Channels.all()
    assert Enum.count(result) > 0
  end

  test "get events" do
    {:ok, result} = Di.Events.all()
    assert Enum.count(result) > 0
  end

  test "get events for channel" do
    {:ok, result} = Di.Events.by_id(1)
    firstEvent = List.first(result)
    assert firstEvent.name != nil
  end

  test "get events for non-existent channel" do
    {:ok, result} = Di.Events.by_id(-1)
    assert result == []
  end

  test "get now playing" do
    {:ok, result} = Di.Tracks.now()
    assert Enum.count(result) > 0 
  end

  test "track history for channel" do
    {:ok, result} = Di.Tracks.recent_by_channel_id(1)
    assert List.first(result).channel_id == 1
  end

  test "get track history for non-existent channel" do
    {:ok, result} = Di.Tracks.recent_by_channel_id(-1)
    assert result == []
  end

  test "get track by id" do
    {:ok, result} = Di.Tracks.info_by_id(396404)
    assert result.title == "Dat Jazz [SIDE A]"
  end
end
