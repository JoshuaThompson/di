# Di - Elixir Wrapper for DI.FM

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add di to your list of dependencies in `mix.exs`:

        def deps do
          [
            {:di, "~> 0.1.0"},
          ]
        end

  2. Ensure di is started before your application:

        def application do
          [applications: [:di]]
        end


###Currently supported routes
1. /track_history - currently playing and recently played tracks
2. /channels
3. /events - upcoming events

This is very much an incomplete wrapper as there are many extra routes and I'm only
adding them as needed.

###Usage

```iex
iex>Di.Tracks.now()
iex>{:ok, [%Track{}]} //list of Track structs
```

Response will come in the form of a {:ok, body} or {:error, reason} tuple.
