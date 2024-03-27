defmodule Qdrantex.MixProject do
  use Mix.Project

  @version "1.8.0"

  def project do
    [
      app: :qdrantex,
      name: "Qdrantex",
      description: "Client library and SDK for the Qdrant",
      version: @version,
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
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
        "cmd protoc -I proto --elixir_opt=package_prefix=qdrantex,include_docs=true --elixir_out=plugins=grpc:./lib/qdrantex/qdrant proto/*.proto"
      ]
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      groups_for_modules: [
        Repo: [
          Qdrantex.Repo,
          Qdrantex
        ],
        SDK: ~r/^Qdrantex\.(Qdrant|Grpc).*/,
      ]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Dmitry Rubinstein"],
      links: %{
        "GitHub" => "https://github.com/Virviil/qdrantex"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.7.0"},
      {:protobuf, "~> 0.12.0"},
      {:db_connection, "~> 2.6"},
      {:ex_doc, "~> 0.31.2", only: :dev, runtime: false}
    ]
  end
end
