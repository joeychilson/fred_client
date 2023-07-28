# FRED

An Elixir-based HTTP Client for FRED (Federal Reserve Economic Data) API

## Installation

`FRED` is available on Hex. Add it to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fred_client, "~> 0.1.0"}
  ]
end
```

## Configuration

```elixir
config :fred_client, :api_key, "api_key"
```
