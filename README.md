# Di - Elixir Wrapper for DI.FM

[![Build Status](https://travis-ci.org/JoshuaThompson/di.svg?branch=master)](https://travis-ci.org/JoshuaThompson/di)

## Installation

Add di to your list of dependencies in `mix.exs`:

        def deps do
            [
                {:di, "~> 0.1.0"},
            ]
        end
        
Ensure di is started before your application:
 
        def application do
            [applications: [:di]]
        end
 

##Currently supported routes
1. /track_history (get currently playing/recently played)
2. /tracks (get detailed information about a track)
3. /channels
4. /events

This is very much an incomplete wrapper as there are many extra routes and I'm only
adding them as needed.  Particularly I have yet to have need for routes that require
user auth.

##Usage

```iex
iex>Di.TracksHistories.now()
iex>{:ok, [%TrackHistory{}]} //list of TrackHistory structs
```

Response will come in the form of a {:ok, body} or {:error, reason} tuple.
