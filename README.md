# Qdrantex

Client library and SDK for the [Qdrant](https://github.com/qdrant/qdrant) vector search engine.

Library contains type definitions for all Qdrant API with gRPC.

## Quickstart

* Define your repo:

  ```elixir
  defmodule MyApp.QdrantRepo do
    use Qdrantex,
    otp_app: :my_app
  end
  ```

  or use default `Qdrantex.Repo`

* Add this repo to your supervision tree:

  ```elixir
  defmodule MyApp.App do
    use Application

    # ...

    def start(_type, _args) do
      import Supervisor.Spec
      children = [
        MyApp.QdrantRepo
        # ...
      ]
      opts = [strategy: :one_for_one, name: MyApp]
      Supervisor.start_link(children, opts)
    end
  end
  ```

* Make requests using protobuf messages with `Repo.run`, enclosuring your parameters. 
  `&1` - is placeholder for gRPC connection, that `Repo` will substitute by itself:

  ```elixir
  Qdrantex.Repo.run(&Qdrantex.Qdrant.Qdrant.Stub.health_check(&1, %Qdrantex.Qdrant.HealthCheckRequest{}))
  
  {:ok, %Qdrantex.Qdrant.HealthCheckReply{
    title: "qdrant - vector search engine",
    version: "1.2.3",
    commit: "acbcbabcdbcbcbdcbbacbdbcbbabcbdbcbabcbdb",
    __unknown_fields__: []
  }}
  ```

## Security

### API Key

Add api key as a parameter for your `Repo` in any suitable place:

```elixir
import Config

config :my_app, MyApp.QdrantRepo
  auth_key: "your_secret_api_key_here"
```

or 

```elixir
  # somewhere in main supervisor
      children = [
        {MyApp.QdrantRepo, [api_key: "your_secret_api_key_here"]}
        # ...
      ]
```

### mTLS Configuration

Add ssl config to repo opts

```elixir
import Config

config :my_app, MyApp.QdrantRepo
  ssl: [
    cacertfile: Path.expand("./ca.crt", :code.priv_dir(:myapp)), 
    certfile: Path.expand("./client.crt", :code.priv_dir(:myapp)), 
    keyfile: Path.expand("./client.key", :code.priv_dir(:myapp)),
    verify: :verify_peer,
    server_name_indication: 'myapp'
]
```


## Versions match

`MAJOR.MINOR` version for this library matches `MAJOR.MINOR` version of QDrant's protbuf

## Installation

The package can be installed by adding `qdrantex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:qdrantex, "~> 1.8.0"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/qdrantex>.
