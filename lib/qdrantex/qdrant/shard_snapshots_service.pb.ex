defmodule Qdrantex.Qdrant.ShardSnapshotPriority do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ShardSnapshotPriorityNoSync, 0
  field :ShardSnapshotPrioritySnapshot, 1
  field :ShardSnapshotPriorityReplica, 2
  field :ShardSnapshotPriorityShardTransfer, 3
end

defmodule Qdrantex.Qdrant.CreateShardSnapshotRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.ListShardSnapshotsRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.DeleteShardSnapshotRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"
  field :snapshot_name, 3, type: :string, json_name: "snapshotName"
end

defmodule Qdrantex.Qdrant.RecoverShardSnapshotRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :shard_id, 2, type: :uint32, json_name: "shardId"

  field :snapshot_location, 3,
    type: Qdrantex.Qdrant.ShardSnapshotLocation,
    json_name: "snapshotLocation"

  field :snapshot_priority, 4,
    type: Qdrantex.Qdrant.ShardSnapshotPriority,
    json_name: "snapshotPriority",
    enum: true

  field :checksum, 5, proto3_optional: true, type: :string
end

defmodule Qdrantex.Qdrant.ShardSnapshotLocation do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :location, 0

  field :url, 1, type: :string, oneof: 0
  field :path, 2, type: :string, oneof: 0
end

defmodule Qdrantex.Qdrant.RecoverSnapshotResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :time, 1, type: :double
end

defmodule Qdrantex.Qdrant.ShardSnapshots.Service do
  use GRPC.Service, name: "qdrant.ShardSnapshots", protoc_gen_elixir_version: "0.12.0"

  rpc :Create, Qdrantex.Qdrant.CreateShardSnapshotRequest, Qdrantex.Qdrant.CreateSnapshotResponse

  rpc :List, Qdrantex.Qdrant.ListShardSnapshotsRequest, Qdrantex.Qdrant.ListSnapshotsResponse

  rpc :Delete, Qdrantex.Qdrant.DeleteShardSnapshotRequest, Qdrantex.Qdrant.DeleteSnapshotResponse

  rpc :Recover,
      Qdrantex.Qdrant.RecoverShardSnapshotRequest,
      Qdrantex.Qdrant.RecoverSnapshotResponse
end

defmodule Qdrantex.Qdrant.ShardSnapshots.Stub do
  use GRPC.Stub, service: Qdrantex.Qdrant.ShardSnapshots.Service
end