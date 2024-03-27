defmodule Qdrantex.Qdrant.GetCollectionInfoRequestInternal do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :get_collectionInfoRequest, 1,
    type: Qdrantex.Qdrant.GetCollectionInfoRequest,
    json_name: "getCollectionInfoRequest"

  field :shard_id, 2, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.InitiateShardTransferRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.WaitForShardStateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
  field :state, 3, type: Qdrantex.Qdrant.ReplicaState, enum: true
  field :timeout, 4, type: :uint64
end

defmodule Qdrantex.Qdrant.GetShardRecoveryPointRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.GetShardRecoveryPointResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :recovery_point, 1, type: Qdrantex.Qdrant.RecoveryPoint, json_name: "recoveryPoint"
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.RecoveryPoint do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :clocks, 1, repeated: true, type: Qdrantex.Qdrant.RecoveryPointClockTag
end

defmodule Qdrantex.Qdrant.RecoveryPointClockTag do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :peer_id, 1, type: :uint64, json_name: "peerId"
  field :clock_id, 2, type: :uint32, json_name: "clockId"
  field :clock_tick, 3, type: :uint64, json_name: "clockTick"
  field :token, 4, type: :uint64
end

defmodule Qdrantex.Qdrant.UpdateShardCutoffPointRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
  field :cutoff, 3, type: Qdrantex.Qdrant.RecoveryPoint
end

defmodule Qdrantex.Qdrant.CollectionsInternal.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.CollectionsInternal", protoc_gen_elixir_version: "0.12.0"

  rpc :Get,
      Qdrantex.Qdrant.GetCollectionInfoRequestInternal,
      Qdrantex.Qdrant.GetCollectionInfoResponse

  rpc :Initiate,
      Qdrantex.Qdrant.InitiateShardTransferRequest,
      Qdrantex.Qdrant.CollectionOperationResponse

  rpc :WaitForShardState,
      Qdrantex.Qdrant.WaitForShardStateRequest,
      Qdrantex.Qdrant.CollectionOperationResponse

  rpc :GetShardRecoveryPoint,
      Qdrantex.Qdrant.GetShardRecoveryPointRequest,
      Qdrantex.Qdrant.GetShardRecoveryPointResponse

  rpc :UpdateShardCutoffPoint,
      Qdrantex.Qdrant.UpdateShardCutoffPointRequest,
      Qdrantex.Qdrant.CollectionOperationResponse
end

defmodule Qdrantex.Qdrant.CollectionsInternal.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.CollectionsInternal.Service
end