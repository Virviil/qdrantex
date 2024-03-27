defmodule Qdrantex.Qdrant.GetConsensusCommitRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.GetConsensusCommitResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :commit, 1, type: :int64
  field :term, 2, type: :int64
end

defmodule Qdrantex.Qdrant.WaitOnConsensusCommitRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :commit, 1, type: :int64
  field :term, 2, type: :int64
  field :timeout, 3, type: :int64
end

defmodule Qdrantex.Qdrant.WaitOnConsensusCommitResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ok, 1, type: :bool
end

defmodule Qdrantex.Qdrant.QdrantInternal.Service do
  use GRPC.Service, name: "qdrant.QdrantInternal", protoc_gen_elixir_version: "0.12.0"

  rpc :GetConsensusCommit,
      Qdrantex.Qdrant.GetConsensusCommitRequest,
      Qdrantex.Qdrant.GetConsensusCommitResponse

  rpc :WaitOnConsensusCommit,
      Qdrantex.Qdrant.WaitOnConsensusCommitRequest,
      Qdrantex.Qdrant.WaitOnConsensusCommitResponse
end

defmodule Qdrantex.Qdrant.QdrantInternal.Stub do
  use GRPC.Stub, service: Qdrantex.Qdrant.QdrantInternal.Service
end