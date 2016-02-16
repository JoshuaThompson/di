# Di - Elixir Wrapper for DI.FM

[![Build Status](https://travis-ci.org/JoshuaThompson/di.svg?branch=master)](https://travis-ci.org/JoshuaThompson/di)

## Installation

  1. Add di to your list of dependencies in `mix.exs`:

        def deps do
          [
            {:di, "~> 0.1.0"},
          ]
        end

##Currently supported routes
1. /track_history
2. /channels
3. /events

This is very much an incomplete wrapper as there are many extra routes and I'm only
adding them as needed.  Particularly I have yet to have need for routes that require
user auth.

##Usage

```iex
iex>Di.Tracks.now()
iex>{:ok, [%Track{}]} //list of Track structs
```

Response will come in the form of a {:ok, body} or {:error, reason} tuple.
