defmodule Qdrant.HealthCheckRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrant.HealthCheckReply do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :title, 1, type: :string
  field :version, 2, type: :string
end

defmodule Qdrant.Qdrant.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Qdrant", protoc_gen_elixir_version: "0.11.0"

  rpc :HealthCheck, Qdrant.HealthCheckRequest, Qdrant.HealthCheckReply
end

defmodule Qdrant.Qdrant.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrant.Qdrant.Service
end