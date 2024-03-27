defmodule Qdrantex.Qdrant.HealthCheckRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.HealthCheckReply do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :title, 1, type: :string
  field :version, 2, type: :string
  field :commit, 3, proto3_optional: true, type: :string
end

defmodule Qdrantex.Qdrant.Qdrant.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.Qdrant", protoc_gen_elixir_version: "0.12.0"

  rpc :HealthCheck, Qdrantex.Qdrant.HealthCheckRequest, Qdrantex.Qdrant.HealthCheckReply
end

defmodule Qdrantex.Qdrant.Qdrant.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.Qdrant.Service
end
