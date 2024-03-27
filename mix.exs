defmodule Qdrantex.MixProject do
  use Mix.Project

  def project do
    [
      app: :qdrantex,
      version: "1.8.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases() do
    [
      "pb.pull": [
        "cmd scripts/pull_proto.bash"
      ],
      protoc: [
        "cmd protoc -I proto --elixir_opt=package_prefix=qdrantex --elixir_out=plugins=grpc:./lib/qdrantex/qdrant proto/*.proto"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.7.0"},
      {:protobuf, "~> 0.12.0"},
      {:db_connection, "~> 2.6"}
    ]
  end
end
