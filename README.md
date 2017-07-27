# ExPhaxio

An Elixir client for [Phaxio](https://www.phaxio.com/).

Warning: this is not production-ready! Use at your own risk.

## Configuration

You will need a key and secret from your Phaxio console.

```elixir
config :ex_phaxio,
  phaxio_key: "PHAXIO_KEY",
  phaxio_secret: "PHAXIO_SECRET"
```

## Installation

```elixir
def deps do
  [
    {:ex_phaxio, "~> 0.1.0"}
  ]
end
```

## Development

It's recommended to use your `test` key while developing (so as to not incur charges).

## License

ExPhaxio free software licensed under [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0).
