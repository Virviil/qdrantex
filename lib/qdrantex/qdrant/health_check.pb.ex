defmodule Qdrantex.Grpc.Health.V1.HealthCheckResponse.ServingStatus do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SERVING, 1
  field :NOT_SERVING, 2
  field :SERVICE_UNKNOWN, 3
end

defmodule Qdrantex.Grpc.Health.V1.HealthCheckRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :service, 1, type: :string
end

defmodule Qdrantex.Grpc.Health.V1.HealthCheckResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :status, 1, type: Qdrantex.Grpc.Health.V1.HealthCheckResponse.ServingStatus, enum: true
end

defmodule Qdrantex.Grpc.Health.V1.Health.Service do
  use GRPC.Service, name: "grpc.health.v1.Health", protoc_gen_elixir_version: "0.12.0"

  rpc :Check,
      Qdrantex.Grpc.Health.V1.HealthCheckRequest,
      Qdrantex.Grpc.Health.V1.HealthCheckResponse
end

defmodule Qdrantex.Grpc.Health.V1.Health.Stub do
  use GRPC.Stub, service: Qdrantex.Grpc.Health.V1.Health.Service
end