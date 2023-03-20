# Qdrantex

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `qdrantex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:qdrantex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/qdrantex>.



{:ok, chan} = GRPC.Stub.connect("localhost:6334", interceptors: [GRPC.Client.Interceptors.Logger])
chan |> Qdrantex.Qdrantex.Stub.health_check(Qdrantex.HealthCheckRequest.new())