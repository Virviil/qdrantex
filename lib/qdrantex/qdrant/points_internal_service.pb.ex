defmodule Qdrantex.Qdrant.SyncPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, repeated: true, type: Qdrantex.Qdrant.PointStruct
  field :from_id, 4, proto3_optional: true, type: Qdrantex.Qdrant.PointId, json_name: "fromId"
  field :to_id, 5, proto3_optional: true, type: Qdrantex.Qdrant.PointId, json_name: "toId"
  field :ordering, 6, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering
end

defmodule Qdrantex.Qdrant.SyncPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :sync_points, 1, type: Qdrantex.Qdrant.SyncPoints, json_name: "syncPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.UpsertPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :upsert_points, 1, type: Qdrantex.Qdrant.UpsertPoints, json_name: "upsertPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.DeletePointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :delete_points, 1, type: Qdrantex.Qdrant.DeletePoints, json_name: "deletePoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.UpdateVectorsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :update_vectors, 1, type: Qdrantex.Qdrant.UpdatePointVectors, json_name: "updateVectors"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.DeleteVectorsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :delete_vectors, 1, type: Qdrantex.Qdrant.DeletePointVectors, json_name: "deleteVectors"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.SetPayloadPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :set_payload_points, 1,
    type: Qdrantex.Qdrant.SetPayloadPoints,
    json_name: "setPayloadPoints"

  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.DeletePayloadPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :delete_payload_points, 1,
    type: Qdrantex.Qdrant.DeletePayloadPoints,
    json_name: "deletePayloadPoints"

  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.ClearPayloadPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :clear_payload_points, 1,
    type: Qdrantex.Qdrant.ClearPayloadPoints,
    json_name: "clearPayloadPoints"

  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.CreateFieldIndexCollectionInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :create_field_index_collection, 1,
    type: Qdrantex.Qdrant.CreateFieldIndexCollection,
    json_name: "createFieldIndexCollection"

  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.DeleteFieldIndexCollectionInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :delete_field_index_collection, 1,
    type: Qdrantex.Qdrant.DeleteFieldIndexCollection,
    json_name: "deleteFieldIndexCollection"

  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.PointsOperationResponseInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.UpdateResultInternal
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.UpdateResultInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :operation_id, 1, proto3_optional: true, type: :uint64, json_name: "operationId"
  field :status, 2, type: Qdrantex.Qdrant.UpdateStatus, enum: true

  field :clock_tag, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ClockTag,
    json_name: "clockTag"
end

defmodule Qdrantex.Qdrant.ClockTag do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :peer_id, 1, type: :uint64, json_name: "peerId"
  field :clock_id, 2, type: :uint32, json_name: "clockId"
  field :clock_tick, 3, type: :uint64, json_name: "clockTick"
  field :token, 4, type: :uint64
  field :force, 5, type: :bool
end

defmodule Qdrantex.Qdrant.SearchPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :search_points, 1, type: Qdrantex.Qdrant.SearchPoints, json_name: "searchPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.SearchBatchPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :search_points, 2,
    repeated: true,
    type: Qdrantex.Qdrant.SearchPoints,
    json_name: "searchPoints"

  field :shard_id, 3, proto3_optional: true, type: :uint32, json_name: "shardId"
  field :timeout, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.RecoQuery do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :positives, 1, repeated: true, type: Qdrantex.Qdrant.Vector
  field :negatives, 2, repeated: true, type: Qdrantex.Qdrant.Vector
end

defmodule Qdrantex.Qdrant.ContextPair do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :positive, 1, type: Qdrantex.Qdrant.Vector
  field :negative, 2, type: Qdrantex.Qdrant.Vector
end

defmodule Qdrantex.Qdrant.DiscoveryQuery do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :target, 1, type: Qdrantex.Qdrant.Vector
  field :context, 2, repeated: true, type: Qdrantex.Qdrant.ContextPair
end

defmodule Qdrantex.Qdrant.ContextQuery do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :context, 1, repeated: true, type: Qdrantex.Qdrant.ContextPair
end

defmodule Qdrantex.Qdrant.QueryEnum do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :query, 0

  field :nearest_neighbors, 1,
    type: Qdrantex.Qdrant.Vector,
    json_name: "nearestNeighbors",
    oneof: 0

  field :recommend_best_score, 2,
    type: Qdrantex.Qdrant.RecoQuery,
    json_name: "recommendBestScore",
    oneof: 0

  field :discover, 3, type: Qdrantex.Qdrant.DiscoveryQuery, oneof: 0
  field :context, 4, type: Qdrantex.Qdrant.ContextQuery, oneof: 0
end

defmodule Qdrantex.Qdrant.CoreSearchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :query, 2, type: Qdrantex.Qdrant.QueryEnum
  field :filter, 3, type: Qdrantex.Qdrant.Filter
  field :limit, 4, type: :uint64
  field :with_payload, 5, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 6, type: Qdrantex.Qdrant.SearchParams
  field :score_threshold, 7, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :offset, 8, proto3_optional: true, type: :uint64
  field :vector_name, 9, proto3_optional: true, type: :string, json_name: "vectorName"

  field :with_vectors, 10,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 11,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Qdrant.CoreSearchBatchPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :search_points, 2,
    repeated: true,
    type: Qdrantex.Qdrant.CoreSearchPoints,
    json_name: "searchPoints"

  field :shard_id, 3, proto3_optional: true, type: :uint32, json_name: "shardId"
  field :timeout, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.ScrollPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :scroll_points, 1, type: Qdrantex.Qdrant.ScrollPoints, json_name: "scrollPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.RecommendPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :recommend_points, 1, type: Qdrantex.Qdrant.RecommendPoints, json_name: "recommendPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.GetPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :get_points, 1, type: Qdrantex.Qdrant.GetPoints, json_name: "getPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.CountPointsInternal do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :count_points, 1, type: Qdrantex.Qdrant.CountPoints, json_name: "countPoints"
  field :shard_id, 2, proto3_optional: true, type: :uint32, json_name: "shardId"
end

defmodule Qdrantex.Qdrant.PointsInternal.Service do
  use GRPC.Service, name: "qdrant.PointsInternal", protoc_gen_elixir_version: "0.12.0"

  rpc :Upsert,
      Qdrantex.Qdrant.UpsertPointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :Sync, Qdrantex.Qdrant.SyncPointsInternal, Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :Delete,
      Qdrantex.Qdrant.DeletePointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :UpdateVectors,
      Qdrantex.Qdrant.UpdateVectorsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :DeleteVectors,
      Qdrantex.Qdrant.DeleteVectorsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :SetPayload,
      Qdrantex.Qdrant.SetPayloadPointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :OverwritePayload,
      Qdrantex.Qdrant.SetPayloadPointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :DeletePayload,
      Qdrantex.Qdrant.DeletePayloadPointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :ClearPayload,
      Qdrantex.Qdrant.ClearPayloadPointsInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :CreateFieldIndex,
      Qdrantex.Qdrant.CreateFieldIndexCollectionInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :DeleteFieldIndex,
      Qdrantex.Qdrant.DeleteFieldIndexCollectionInternal,
      Qdrantex.Qdrant.PointsOperationResponseInternal

  rpc :Search, Qdrantex.Qdrant.SearchPointsInternal, Qdrantex.Qdrant.SearchResponse

  rpc :SearchBatch, Qdrantex.Qdrant.SearchBatchPointsInternal, Qdrantex.Qdrant.SearchBatchResponse

  rpc :CoreSearchBatch,
      Qdrantex.Qdrant.CoreSearchBatchPointsInternal,
      Qdrantex.Qdrant.SearchBatchResponse

  rpc :Scroll, Qdrantex.Qdrant.ScrollPointsInternal, Qdrantex.Qdrant.ScrollResponse

  rpc :Count, Qdrantex.Qdrant.CountPointsInternal, Qdrantex.Qdrant.CountResponse

  rpc :Recommend, Qdrantex.Qdrant.RecommendPointsInternal, Qdrantex.Qdrant.RecommendResponse

  rpc :Get, Qdrantex.Qdrant.GetPointsInternal, Qdrantex.Qdrant.GetResponse
end

defmodule Qdrantex.Qdrant.PointsInternal.Stub do
  use GRPC.Stub, service: Qdrantex.Qdrant.PointsInternal.Service
end