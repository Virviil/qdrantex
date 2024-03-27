defmodule Qdrantex.Qdrant.WriteOrderingType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :Weak, 0
  field :Medium, 1
  field :Strong, 2
end

defmodule Qdrantex.Qdrant.ReadConsistencyType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :All, 0
  field :Majority, 1
  field :Quorum, 2
end

defmodule Qdrantex.Qdrant.FieldType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :FieldTypeKeyword, 0
  field :FieldTypeInteger, 1
  field :FieldTypeFloat, 2
  field :FieldTypeGeo, 3
  field :FieldTypeText, 4
  field :FieldTypeBool, 5
  field :FieldTypeDatetime, 6
end

defmodule Qdrantex.Qdrant.Direction do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :Asc, 0
  field :Desc, 1
end

defmodule Qdrantex.Qdrant.RecommendStrategy do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :AverageVector, 0
  field :BestScore, 1
end

defmodule Qdrantex.Qdrant.UpdateStatus do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UnknownUpdateStatus, 0
  field :Acknowledged, 1
  field :Completed, 2
  field :ClockRejected, 3
end

defmodule Qdrantex.Qdrant.WriteOrdering do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :type, 1, type: Qdrantex.Qdrant.WriteOrderingType, enum: true
end

defmodule Qdrantex.Qdrant.ReadConsistency do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :value, 0

  field :type, 1, type: Qdrantex.Qdrant.ReadConsistencyType, enum: true, oneof: 0
  field :factor, 2, type: :uint64, oneof: 0
end

defmodule Qdrantex.Qdrant.PointId do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :point_id_options, 0

  field :num, 1, type: :uint64, oneof: 0
  field :uuid, 2, type: :string, oneof: 0
end

defmodule Qdrantex.Qdrant.SparseIndices do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :data, 1, repeated: true, type: :uint32
end

defmodule Qdrantex.Qdrant.Vector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :data, 1, repeated: true, type: :float
  field :indices, 2, proto3_optional: true, type: Qdrantex.Qdrant.SparseIndices
end

defmodule Qdrantex.Qdrant.ShardKeySelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_keys, 1, repeated: true, type: Qdrantex.Qdrant.ShardKey, json_name: "shardKeys"
end

defmodule Qdrantex.Qdrant.UpsertPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, repeated: true, type: Qdrantex.Qdrant.PointStruct
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.DeletePoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, type: Qdrantex.Qdrant.PointsSelector
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.GetPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :ids, 2, repeated: true, type: Qdrantex.Qdrant.PointId
  field :with_payload, 4, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"

  field :with_vectors, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 6,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :shard_key_selector, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.UpdatePointVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, repeated: true, type: Qdrantex.Qdrant.PointVectors
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Qdrant.PointId
  field :vectors, 2, type: Qdrantex.Qdrant.Vectors
end

defmodule Qdrantex.Qdrant.DeletePointVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points_selector, 3, type: Qdrantex.Qdrant.PointsSelector, json_name: "pointsSelector"
  field :vectors, 4, type: Qdrantex.Qdrant.VectorsSelector
  field :ordering, 5, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 6,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.SetPayloadPoints.PayloadEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Value
end

defmodule Qdrantex.Qdrant.SetPayloadPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool

  field :payload, 3,
    repeated: true,
    type: Qdrantex.Qdrant.SetPayloadPoints.PayloadEntry,
    map: true

  field :points_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"

  field :key, 8, proto3_optional: true, type: :string
end

defmodule Qdrantex.Qdrant.DeletePayloadPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :keys, 3, repeated: true, type: :string

  field :points_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.ClearPayloadPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, type: Qdrantex.Qdrant.PointsSelector
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering

  field :shard_key_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.CreateFieldIndexCollection do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :field_name, 3, type: :string, json_name: "fieldName"

  field :field_type, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.FieldType,
    json_name: "fieldType",
    enum: true

  field :field_index_params, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PayloadIndexParams,
    json_name: "fieldIndexParams"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering
end

defmodule Qdrantex.Qdrant.DeleteFieldIndexCollection do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :field_name, 3, type: :string, json_name: "fieldName"
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering
end

defmodule Qdrantex.Qdrant.PayloadIncludeSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :fields, 1, repeated: true, type: :string
end

defmodule Qdrantex.Qdrant.PayloadExcludeSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :fields, 1, repeated: true, type: :string
end

defmodule Qdrantex.Qdrant.WithPayloadSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :selector_options, 0

  field :enable, 1, type: :bool, oneof: 0
  field :include, 2, type: Qdrantex.Qdrant.PayloadIncludeSelector, oneof: 0
  field :exclude, 3, type: Qdrantex.Qdrant.PayloadExcludeSelector, oneof: 0
end

defmodule Qdrantex.Qdrant.NamedVectors.VectorsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Vector
end

defmodule Qdrantex.Qdrant.NamedVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :vectors, 1, repeated: true, type: Qdrantex.Qdrant.NamedVectors.VectorsEntry, map: true
end

defmodule Qdrantex.Qdrant.Vectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :vectors_options, 0

  field :vector, 1, type: Qdrantex.Qdrant.Vector, oneof: 0
  field :vectors, 2, type: Qdrantex.Qdrant.NamedVectors, oneof: 0
end

defmodule Qdrantex.Qdrant.VectorsSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :names, 1, repeated: true, type: :string
end

defmodule Qdrantex.Qdrant.WithVectorsSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :selector_options, 0

  field :enable, 1, type: :bool, oneof: 0
  field :include, 2, type: Qdrantex.Qdrant.VectorsSelector, oneof: 0
end

defmodule Qdrantex.Qdrant.QuantizationSearchParams do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ignore, 1, proto3_optional: true, type: :bool
  field :rescore, 2, proto3_optional: true, type: :bool
  field :oversampling, 3, proto3_optional: true, type: :double
end

defmodule Qdrantex.Qdrant.SearchParams do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :hnsw_ef, 1, proto3_optional: true, type: :uint64, json_name: "hnswEf"
  field :exact, 2, proto3_optional: true, type: :bool
  field :quantization, 3, proto3_optional: true, type: Qdrantex.Qdrant.QuantizationSearchParams
  field :indexed_only, 4, proto3_optional: true, type: :bool, json_name: "indexedOnly"
end

defmodule Qdrantex.Qdrant.SearchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :vector, 2, repeated: true, type: :float
  field :filter, 3, type: Qdrantex.Qdrant.Filter
  field :limit, 4, type: :uint64
  field :with_payload, 6, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 7, type: Qdrantex.Qdrant.SearchParams
  field :score_threshold, 8, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :offset, 9, proto3_optional: true, type: :uint64
  field :vector_name, 10, proto3_optional: true, type: :string, json_name: "vectorName"

  field :with_vectors, 11,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 12,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :timeout, 13, proto3_optional: true, type: :uint64

  field :shard_key_selector, 14,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"

  field :sparse_indices, 15,
    proto3_optional: true,
    type: Qdrantex.Qdrant.SparseIndices,
    json_name: "sparseIndices"
end

defmodule Qdrantex.Qdrant.SearchBatchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :search_points, 2,
    repeated: true,
    type: Qdrantex.Qdrant.SearchPoints,
    json_name: "searchPoints"

  field :read_consistency, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :timeout, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.WithLookup do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection, 1, type: :string

  field :with_payload, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithPayloadSelector,
    json_name: "withPayload"

  field :with_vectors, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"
end

defmodule Qdrantex.Qdrant.SearchPointGroups do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :vector, 2, repeated: true, type: :float
  field :filter, 3, type: Qdrantex.Qdrant.Filter
  field :limit, 4, type: :uint32
  field :with_payload, 5, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 6, type: Qdrantex.Qdrant.SearchParams
  field :score_threshold, 7, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :vector_name, 8, proto3_optional: true, type: :string, json_name: "vectorName"

  field :with_vectors, 9,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :group_by, 10, type: :string, json_name: "groupBy"
  field :group_size, 11, type: :uint32, json_name: "groupSize"

  field :read_consistency, 12,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :with_lookup, 13,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithLookup,
    json_name: "withLookup"

  field :timeout, 14, proto3_optional: true, type: :uint64

  field :shard_key_selector, 15,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"

  field :sparse_indices, 16,
    proto3_optional: true,
    type: Qdrantex.Qdrant.SparseIndices,
    json_name: "sparseIndices"
end

defmodule Qdrantex.Qdrant.StartFrom do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :value, 0

  field :float, 1, type: :double, oneof: 0
  field :integer, 2, type: :int64, oneof: 0
  field :timestamp, 3, type: Google.Protobuf.Timestamp, oneof: 0
  field :datetime, 4, type: :string, oneof: 0
end

defmodule Qdrantex.Qdrant.OrderBy do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :direction, 2, proto3_optional: true, type: Qdrantex.Qdrant.Direction, enum: true

  field :start_from, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.StartFrom,
    json_name: "startFrom"
end

defmodule Qdrantex.Qdrant.ScrollPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :filter, 2, type: Qdrantex.Qdrant.Filter
  field :offset, 3, proto3_optional: true, type: Qdrantex.Qdrant.PointId
  field :limit, 4, proto3_optional: true, type: :uint32
  field :with_payload, 6, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"

  field :with_vectors, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 8,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :shard_key_selector, 9,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"

  field :order_by, 10, proto3_optional: true, type: Qdrantex.Qdrant.OrderBy, json_name: "orderBy"
end

defmodule Qdrantex.Qdrant.LookupLocation do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :vector_name, 2, proto3_optional: true, type: :string, json_name: "vectorName"

  field :shard_key_selector, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.RecommendPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :positive, 2, repeated: true, type: Qdrantex.Qdrant.PointId
  field :negative, 3, repeated: true, type: Qdrantex.Qdrant.PointId
  field :filter, 4, type: Qdrantex.Qdrant.Filter
  field :limit, 5, type: :uint64
  field :with_payload, 7, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 8, type: Qdrantex.Qdrant.SearchParams
  field :score_threshold, 9, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :offset, 10, proto3_optional: true, type: :uint64
  field :using, 11, proto3_optional: true, type: :string

  field :with_vectors, 12,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :lookup_from, 13,
    proto3_optional: true,
    type: Qdrantex.Qdrant.LookupLocation,
    json_name: "lookupFrom"

  field :read_consistency, 14,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :strategy, 16, proto3_optional: true, type: Qdrantex.Qdrant.RecommendStrategy, enum: true

  field :positive_vectors, 17,
    repeated: true,
    type: Qdrantex.Qdrant.Vector,
    json_name: "positiveVectors"

  field :negative_vectors, 18,
    repeated: true,
    type: Qdrantex.Qdrant.Vector,
    json_name: "negativeVectors"

  field :timeout, 19, proto3_optional: true, type: :uint64

  field :shard_key_selector, 20,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.RecommendBatchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :recommend_points, 2,
    repeated: true,
    type: Qdrantex.Qdrant.RecommendPoints,
    json_name: "recommendPoints"

  field :read_consistency, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :timeout, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.RecommendPointGroups do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :positive, 2, repeated: true, type: Qdrantex.Qdrant.PointId
  field :negative, 3, repeated: true, type: Qdrantex.Qdrant.PointId
  field :filter, 4, type: Qdrantex.Qdrant.Filter
  field :limit, 5, type: :uint32
  field :with_payload, 6, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 7, type: Qdrantex.Qdrant.SearchParams
  field :score_threshold, 8, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :using, 9, proto3_optional: true, type: :string

  field :with_vectors, 10,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :lookup_from, 11,
    proto3_optional: true,
    type: Qdrantex.Qdrant.LookupLocation,
    json_name: "lookupFrom"

  field :group_by, 12, type: :string, json_name: "groupBy"
  field :group_size, 13, type: :uint32, json_name: "groupSize"

  field :read_consistency, 14,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :with_lookup, 15,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithLookup,
    json_name: "withLookup"

  field :strategy, 17, proto3_optional: true, type: Qdrantex.Qdrant.RecommendStrategy, enum: true

  field :positive_vectors, 18,
    repeated: true,
    type: Qdrantex.Qdrant.Vector,
    json_name: "positiveVectors"

  field :negative_vectors, 19,
    repeated: true,
    type: Qdrantex.Qdrant.Vector,
    json_name: "negativeVectors"

  field :timeout, 20, proto3_optional: true, type: :uint64

  field :shard_key_selector, 21,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.TargetVector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :target, 0

  field :single, 1, type: Qdrantex.Qdrant.VectorExample, oneof: 0
end

defmodule Qdrantex.Qdrant.VectorExample do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :example, 0

  field :id, 1, type: Qdrantex.Qdrant.PointId, oneof: 0
  field :vector, 2, type: Qdrantex.Qdrant.Vector, oneof: 0
end

defmodule Qdrantex.Qdrant.ContextExamplePair do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :positive, 1, type: Qdrantex.Qdrant.VectorExample
  field :negative, 2, type: Qdrantex.Qdrant.VectorExample
end

defmodule Qdrantex.Qdrant.DiscoverPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :target, 2, type: Qdrantex.Qdrant.TargetVector
  field :context, 3, repeated: true, type: Qdrantex.Qdrant.ContextExamplePair
  field :filter, 4, type: Qdrantex.Qdrant.Filter
  field :limit, 5, type: :uint64
  field :with_payload, 6, type: Qdrantex.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 7, type: Qdrantex.Qdrant.SearchParams
  field :offset, 8, proto3_optional: true, type: :uint64
  field :using, 9, proto3_optional: true, type: :string

  field :with_vectors, 10,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :lookup_from, 11,
    proto3_optional: true,
    type: Qdrantex.Qdrant.LookupLocation,
    json_name: "lookupFrom"

  field :read_consistency, 12,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :timeout, 13, proto3_optional: true, type: :uint64

  field :shard_key_selector, 14,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.DiscoverBatchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :discover_points, 2,
    repeated: true,
    type: Qdrantex.Qdrant.DiscoverPoints,
    json_name: "discoverPoints"

  field :read_consistency, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :timeout, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.CountPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :filter, 2, type: Qdrantex.Qdrant.Filter
  field :exact, 3, proto3_optional: true, type: :bool

  field :read_consistency, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ReadConsistency,
    json_name: "readConsistency"

  field :shard_key_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.PointStructList do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points, 1, repeated: true, type: Qdrantex.Qdrant.PointStruct

  field :shard_key_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.SetPayload.PayloadEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Value
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.SetPayload do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :payload, 1,
    repeated: true,
    type: Qdrantex.Qdrant.PointsUpdateOperation.SetPayload.PayloadEntry,
    map: true

  field :points_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :shard_key_selector, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"

  field :key, 4, proto3_optional: true, type: :string
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.DeletePayload do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :keys, 1, repeated: true, type: :string

  field :points_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :shard_key_selector, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.UpdateVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points, 1, repeated: true, type: Qdrantex.Qdrant.PointVectors

  field :shard_key_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.DeleteVectors do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points_selector, 1, type: Qdrantex.Qdrant.PointsSelector, json_name: "pointsSelector"
  field :vectors, 2, type: Qdrantex.Qdrant.VectorsSelector

  field :shard_key_selector, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.DeletePoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points, 1, type: Qdrantex.Qdrant.PointsSelector

  field :shard_key_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation.ClearPayload do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points, 1, type: Qdrantex.Qdrant.PointsSelector

  field :shard_key_selector, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKeySelector,
    json_name: "shardKeySelector"
end

defmodule Qdrantex.Qdrant.PointsUpdateOperation do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :operation, 0

  field :upsert, 1, type: Qdrantex.Qdrant.PointsUpdateOperation.PointStructList, oneof: 0

  field :delete_deprecated, 2,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "deleteDeprecated",
    oneof: 0,
    deprecated: true

  field :set_payload, 3,
    type: Qdrantex.Qdrant.PointsUpdateOperation.SetPayload,
    json_name: "setPayload",
    oneof: 0

  field :overwrite_payload, 4,
    type: Qdrantex.Qdrant.PointsUpdateOperation.SetPayload,
    json_name: "overwritePayload",
    oneof: 0

  field :delete_payload, 5,
    type: Qdrantex.Qdrant.PointsUpdateOperation.DeletePayload,
    json_name: "deletePayload",
    oneof: 0

  field :clear_payload_deprecated, 6,
    type: Qdrantex.Qdrant.PointsSelector,
    json_name: "clearPayloadDeprecated",
    oneof: 0,
    deprecated: true

  field :update_vectors, 7,
    type: Qdrantex.Qdrant.PointsUpdateOperation.UpdateVectors,
    json_name: "updateVectors",
    oneof: 0

  field :delete_vectors, 8,
    type: Qdrantex.Qdrant.PointsUpdateOperation.DeleteVectors,
    json_name: "deleteVectors",
    oneof: 0

  field :delete_points, 9,
    type: Qdrantex.Qdrant.PointsUpdateOperation.DeletePoints,
    json_name: "deletePoints",
    oneof: 0

  field :clear_payload, 10,
    type: Qdrantex.Qdrant.PointsUpdateOperation.ClearPayload,
    json_name: "clearPayload",
    oneof: 0
end

defmodule Qdrantex.Qdrant.UpdateBatchPoints do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :operations, 3, repeated: true, type: Qdrantex.Qdrant.PointsUpdateOperation
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Qdrant.WriteOrdering
end

defmodule Qdrantex.Qdrant.PointsOperationResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.UpdateResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.UpdateResult do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :operation_id, 1, proto3_optional: true, type: :uint64, json_name: "operationId"
  field :status, 2, type: Qdrantex.Qdrant.UpdateStatus, enum: true
end

defmodule Qdrantex.Qdrant.ScoredPoint.PayloadEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Value
end

defmodule Qdrantex.Qdrant.ScoredPoint do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Qdrant.PointId
  field :payload, 2, repeated: true, type: Qdrantex.Qdrant.ScoredPoint.PayloadEntry, map: true
  field :score, 3, type: :float
  field :version, 5, type: :uint64
  field :vectors, 6, proto3_optional: true, type: Qdrantex.Qdrant.Vectors

  field :shard_key, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKey,
    json_name: "shardKey"
end

defmodule Qdrantex.Qdrant.GroupId do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :kind, 0

  field :unsigned_value, 1, type: :uint64, json_name: "unsignedValue", oneof: 0
  field :integer_value, 2, type: :int64, json_name: "integerValue", oneof: 0
  field :string_value, 3, type: :string, json_name: "stringValue", oneof: 0
end

defmodule Qdrantex.Qdrant.PointGroup do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Qdrant.GroupId
  field :hits, 2, repeated: true, type: Qdrantex.Qdrant.ScoredPoint
  field :lookup, 3, type: Qdrantex.Qdrant.RetrievedPoint
end

defmodule Qdrantex.Qdrant.GroupsResult do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :groups, 1, repeated: true, type: Qdrantex.Qdrant.PointGroup
end

defmodule Qdrantex.Qdrant.SearchResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.ScoredPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.BatchResult do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.ScoredPoint
end

defmodule Qdrantex.Qdrant.SearchBatchResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.BatchResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.SearchGroupsResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.GroupsResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.CountResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.CountResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.ScrollResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :next_page_offset, 1,
    proto3_optional: true,
    type: Qdrantex.Qdrant.PointId,
    json_name: "nextPageOffset"

  field :result, 2, repeated: true, type: Qdrantex.Qdrant.RetrievedPoint
  field :time, 3, type: :double
end

defmodule Qdrantex.Qdrant.CountResult do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :count, 1, type: :uint64
end

defmodule Qdrantex.Qdrant.RetrievedPoint.PayloadEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Value
end

defmodule Qdrantex.Qdrant.RetrievedPoint do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Qdrant.PointId
  field :payload, 2, repeated: true, type: Qdrantex.Qdrant.RetrievedPoint.PayloadEntry, map: true
  field :vectors, 4, proto3_optional: true, type: Qdrantex.Qdrant.Vectors

  field :shard_key, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKey,
    json_name: "shardKey"
end

defmodule Qdrantex.Qdrant.GetResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.RetrievedPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.RecommendResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.ScoredPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.RecommendBatchResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.BatchResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.DiscoverResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.ScoredPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.DiscoverBatchResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.BatchResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.RecommendGroupsResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.GroupsResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.UpdateBatchResponse do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Qdrant.UpdateResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.Filter do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :should, 1, repeated: true, type: Qdrantex.Qdrant.Condition
  field :must, 2, repeated: true, type: Qdrantex.Qdrant.Condition
  field :must_not, 3, repeated: true, type: Qdrantex.Qdrant.Condition, json_name: "mustNot"

  field :min_should, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.MinShould,
    json_name: "minShould"
end

defmodule Qdrantex.Qdrant.MinShould do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :conditions, 1, repeated: true, type: Qdrantex.Qdrant.Condition
  field :min_count, 2, type: :uint64, json_name: "minCount"
end

defmodule Qdrantex.Qdrant.Condition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :condition_one_of, 0

  field :field, 1, type: Qdrantex.Qdrant.FieldCondition, oneof: 0
  field :is_empty, 2, type: Qdrantex.Qdrant.IsEmptyCondition, json_name: "isEmpty", oneof: 0
  field :has_id, 3, type: Qdrantex.Qdrant.HasIdCondition, json_name: "hasId", oneof: 0
  field :filter, 4, type: Qdrantex.Qdrant.Filter, oneof: 0
  field :is_null, 5, type: Qdrantex.Qdrant.IsNullCondition, json_name: "isNull", oneof: 0
  field :nested, 6, type: Qdrantex.Qdrant.NestedCondition, oneof: 0
end

defmodule Qdrantex.Qdrant.IsEmptyCondition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
end

defmodule Qdrantex.Qdrant.IsNullCondition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
end

defmodule Qdrantex.Qdrant.HasIdCondition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :has_id, 1, repeated: true, type: Qdrantex.Qdrant.PointId, json_name: "hasId"
end

defmodule Qdrantex.Qdrant.NestedCondition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :filter, 2, type: Qdrantex.Qdrant.Filter
end

defmodule Qdrantex.Qdrant.FieldCondition do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :match, 2, type: Qdrantex.Qdrant.Match
  field :range, 3, type: Qdrantex.Qdrant.Range
  field :geo_bounding_box, 4, type: Qdrantex.Qdrant.GeoBoundingBox, json_name: "geoBoundingBox"
  field :geo_radius, 5, type: Qdrantex.Qdrant.GeoRadius, json_name: "geoRadius"
  field :values_count, 6, type: Qdrantex.Qdrant.ValuesCount, json_name: "valuesCount"
  field :geo_polygon, 7, type: Qdrantex.Qdrant.GeoPolygon, json_name: "geoPolygon"
  field :datetime_range, 8, type: Qdrantex.Qdrant.DatetimeRange, json_name: "datetimeRange"
end

defmodule Qdrantex.Qdrant.Match do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :match_value, 0

  field :keyword, 1, type: :string, oneof: 0
  field :integer, 2, type: :int64, oneof: 0
  field :boolean, 3, type: :bool, oneof: 0
  field :text, 4, type: :string, oneof: 0
  field :keywords, 5, type: Qdrantex.Qdrant.RepeatedStrings, oneof: 0
  field :integers, 6, type: Qdrantex.Qdrant.RepeatedIntegers, oneof: 0

  field :except_integers, 7,
    type: Qdrantex.Qdrant.RepeatedIntegers,
    json_name: "exceptIntegers",
    oneof: 0

  field :except_keywords, 8,
    type: Qdrantex.Qdrant.RepeatedStrings,
    json_name: "exceptKeywords",
    oneof: 0
end

defmodule Qdrantex.Qdrant.RepeatedStrings do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :strings, 1, repeated: true, type: :string
end

defmodule Qdrantex.Qdrant.RepeatedIntegers do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :integers, 1, repeated: true, type: :int64
end

defmodule Qdrantex.Qdrant.Range do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lt, 1, proto3_optional: true, type: :double
  field :gt, 2, proto3_optional: true, type: :double
  field :gte, 3, proto3_optional: true, type: :double
  field :lte, 4, proto3_optional: true, type: :double
end

defmodule Qdrantex.Qdrant.DatetimeRange do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lt, 1, proto3_optional: true, type: Google.Protobuf.Timestamp
  field :gt, 2, proto3_optional: true, type: Google.Protobuf.Timestamp
  field :gte, 3, proto3_optional: true, type: Google.Protobuf.Timestamp
  field :lte, 4, proto3_optional: true, type: Google.Protobuf.Timestamp
end

defmodule Qdrantex.Qdrant.GeoBoundingBox do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :top_left, 1, type: Qdrantex.Qdrant.GeoPoint, json_name: "topLeft"
  field :bottom_right, 2, type: Qdrantex.Qdrant.GeoPoint, json_name: "bottomRight"
end

defmodule Qdrantex.Qdrant.GeoRadius do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :center, 1, type: Qdrantex.Qdrant.GeoPoint
  field :radius, 2, type: :float
end

defmodule Qdrantex.Qdrant.GeoLineString do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :points, 1, repeated: true, type: Qdrantex.Qdrant.GeoPoint
end

defmodule Qdrantex.Qdrant.GeoPolygon do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :exterior, 1, type: Qdrantex.Qdrant.GeoLineString
  field :interiors, 2, repeated: true, type: Qdrantex.Qdrant.GeoLineString
end

defmodule Qdrantex.Qdrant.ValuesCount do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lt, 1, proto3_optional: true, type: :uint64
  field :gt, 2, proto3_optional: true, type: :uint64
  field :gte, 3, proto3_optional: true, type: :uint64
  field :lte, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.PointsSelector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :points_selector_one_of, 0

  field :points, 1, type: Qdrantex.Qdrant.PointsIdsList, oneof: 0
  field :filter, 2, type: Qdrantex.Qdrant.Filter, oneof: 0
end

defmodule Qdrantex.Qdrant.PointsIdsList do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ids, 1, repeated: true, type: Qdrantex.Qdrant.PointId
end

defmodule Qdrantex.Qdrant.PointStruct.PayloadEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.Value
end

defmodule Qdrantex.Qdrant.PointStruct do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Qdrant.PointId
  field :payload, 3, repeated: true, type: Qdrantex.Qdrant.PointStruct.PayloadEntry, map: true
  field :vectors, 4, proto3_optional: true, type: Qdrantex.Qdrant.Vectors
end

defmodule Qdrantex.Qdrant.GeoPoint do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lon, 1, type: :double
  field :lat, 2, type: :double
end