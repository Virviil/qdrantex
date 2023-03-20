defmodule Qdrantex.Pb.Qdrant.WriteOrderingType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :Weak, 0
  field :Medium, 1
  field :Strong, 2
end

defmodule Qdrantex.Pb.Qdrant.ReadConsistencyType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :All, 0
  field :Majority, 1
  field :Quorum, 2
end

defmodule Qdrantex.Pb.Qdrant.FieldType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :FieldTypeKeyword, 0
  field :FieldTypeInteger, 1
  field :FieldTypeFloat, 2
  field :FieldTypeGeo, 3
  field :FieldTypeText, 4
end

defmodule Qdrantex.Pb.Qdrant.UpdateStatus do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UnknownUpdateStatus, 0
  field :Acknowledged, 1
  field :Completed, 2
end

defmodule Qdrantex.Pb.Qdrant.WriteOrdering do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :type, 1, type: Qdrantex.Pb.Qdrant.WriteOrderingType, enum: true
end

defmodule Qdrantex.Pb.Qdrant.ReadConsistency do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :value, 0

  field :type, 1, type: Qdrantex.Pb.Qdrant.ReadConsistencyType, enum: true, oneof: 0
  field :factor, 2, type: :uint64, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.PointId do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :point_id_options, 0

  field :num, 1, type: :uint64, oneof: 0
  field :uuid, 2, type: :string, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.Vector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :data, 1, repeated: true, type: :float
end

defmodule Qdrantex.Pb.Qdrant.UpsertPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, repeated: true, type: Qdrantex.Pb.Qdrant.PointStruct
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.DeletePoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, type: Qdrantex.Pb.Qdrant.PointsSelector
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.GetPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :ids, 2, repeated: true, type: Qdrantex.Pb.Qdrant.PointId
  field :with_payload, 4, type: Qdrantex.Pb.Qdrant.WithPayloadSelector, json_name: "withPayload"

  field :with_vectors, 5,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 6,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.SetPayloadPoints.PayloadEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Value
end

defmodule Qdrantex.Pb.Qdrant.SetPayloadPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool

  field :payload, 3,
    repeated: true,
    type: Qdrantex.Pb.Qdrant.SetPayloadPoints.PayloadEntry,
    map: true

  field :points_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.DeletePayloadPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :keys, 3, repeated: true, type: :string

  field :points_selector, 5,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.PointsSelector,
    json_name: "pointsSelector"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.ClearPayloadPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :points, 3, type: Qdrantex.Pb.Qdrant.PointsSelector
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.CreateFieldIndexCollection do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :field_name, 3, type: :string, json_name: "fieldName"

  field :field_type, 4,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.FieldType,
    json_name: "fieldType",
    enum: true

  field :field_index_params, 5,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.PayloadIndexParams,
    json_name: "fieldIndexParams"

  field :ordering, 6, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.DeleteFieldIndexCollection do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :wait, 2, proto3_optional: true, type: :bool
  field :field_name, 3, type: :string, json_name: "fieldName"
  field :ordering, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.WriteOrdering
end

defmodule Qdrantex.Pb.Qdrant.PayloadIncludeSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :fields, 1, repeated: true, type: :string
end

defmodule Qdrantex.Pb.Qdrant.PayloadExcludeSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :fields, 1, repeated: true, type: :string
end

defmodule Qdrantex.Pb.Qdrant.WithPayloadSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :selector_options, 0

  field :enable, 1, type: :bool, oneof: 0
  field :include, 2, type: Qdrantex.Pb.Qdrant.PayloadIncludeSelector, oneof: 0
  field :exclude, 3, type: Qdrantex.Pb.Qdrant.PayloadExcludeSelector, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.NamedVectors.VectorsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Vector
end

defmodule Qdrantex.Pb.Qdrant.NamedVectors do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :vectors, 1, repeated: true, type: Qdrantex.Pb.Qdrant.NamedVectors.VectorsEntry, map: true
end

defmodule Qdrantex.Pb.Qdrant.Vectors do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :vectors_options, 0

  field :vector, 1, type: Qdrantex.Pb.Qdrant.Vector, oneof: 0
  field :vectors, 2, type: Qdrantex.Pb.Qdrant.NamedVectors, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.VectorsSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :names, 1, repeated: true, type: :string
end

defmodule Qdrantex.Pb.Qdrant.WithVectorsSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :selector_options, 0

  field :enable, 1, type: :bool, oneof: 0
  field :include, 2, type: Qdrantex.Pb.Qdrant.VectorsSelector, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.QuantizationSearchParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :ignore, 1, proto3_optional: true, type: :bool
  field :rescore, 2, proto3_optional: true, type: :bool
end

defmodule Qdrantex.Pb.Qdrant.SearchParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :hnsw_ef, 1, proto3_optional: true, type: :uint64, json_name: "hnswEf"
  field :exact, 2, proto3_optional: true, type: :bool
  field :quantization, 3, proto3_optional: true, type: Qdrantex.Pb.Qdrant.QuantizationSearchParams
end

defmodule Qdrantex.Pb.Qdrant.SearchPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :vector, 2, repeated: true, type: :float
  field :filter, 3, type: Qdrantex.Pb.Qdrant.Filter
  field :limit, 4, type: :uint64
  field :with_payload, 6, type: Qdrantex.Pb.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 7, type: Qdrantex.Pb.Qdrant.SearchParams
  field :score_threshold, 8, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :offset, 9, proto3_optional: true, type: :uint64
  field :vector_name, 10, proto3_optional: true, type: :string, json_name: "vectorName"

  field :with_vectors, 11,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 12,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.SearchBatchPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :search_points, 2,
    repeated: true,
    type: Qdrantex.Pb.Qdrant.SearchPoints,
    json_name: "searchPoints"

  field :read_consistency, 3,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.ScrollPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :filter, 2, type: Qdrantex.Pb.Qdrant.Filter
  field :offset, 3, proto3_optional: true, type: Qdrantex.Pb.Qdrant.PointId
  field :limit, 4, proto3_optional: true, type: :uint32
  field :with_payload, 6, type: Qdrantex.Pb.Qdrant.WithPayloadSelector, json_name: "withPayload"

  field :with_vectors, 7,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :read_consistency, 8,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.LookupLocation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :vector_name, 2, proto3_optional: true, type: :string, json_name: "vectorName"
end

defmodule Qdrantex.Pb.Qdrant.RecommendPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :positive, 2, repeated: true, type: Qdrantex.Pb.Qdrant.PointId
  field :negative, 3, repeated: true, type: Qdrantex.Pb.Qdrant.PointId
  field :filter, 4, type: Qdrantex.Pb.Qdrant.Filter
  field :limit, 5, type: :uint64
  field :with_payload, 7, type: Qdrantex.Pb.Qdrant.WithPayloadSelector, json_name: "withPayload"
  field :params, 8, type: Qdrantex.Pb.Qdrant.SearchParams
  field :score_threshold, 9, proto3_optional: true, type: :float, json_name: "scoreThreshold"
  field :offset, 10, proto3_optional: true, type: :uint64
  field :using, 11, proto3_optional: true, type: :string

  field :with_vectors, 12,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.WithVectorsSelector,
    json_name: "withVectors"

  field :lookup_from, 13,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.LookupLocation,
    json_name: "lookupFrom"

  field :read_consistency, 14,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.RecommendBatchPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :recommend_points, 2,
    repeated: true,
    type: Qdrantex.Pb.Qdrant.RecommendPoints,
    json_name: "recommendPoints"

  field :read_consistency, 3,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.ReadConsistency,
    json_name: "readConsistency"
end

defmodule Qdrantex.Pb.Qdrant.CountPoints do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :filter, 2, type: Qdrantex.Pb.Qdrant.Filter
  field :exact, 3, proto3_optional: true, type: :bool
end

defmodule Qdrantex.Pb.Qdrant.PointsOperationResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Pb.Qdrant.UpdateResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.UpdateResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :operation_id, 1, type: :uint64, json_name: "operationId"
  field :status, 2, type: Qdrantex.Pb.Qdrant.UpdateStatus, enum: true
end

defmodule Qdrantex.Pb.Qdrant.ScoredPoint.PayloadEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Value
end

defmodule Qdrantex.Pb.Qdrant.ScoredPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Pb.Qdrant.PointId
  field :payload, 2, repeated: true, type: Qdrantex.Pb.Qdrant.ScoredPoint.PayloadEntry, map: true
  field :score, 3, type: :float
  field :version, 5, type: :uint64
  field :vectors, 6, proto3_optional: true, type: Qdrantex.Pb.Qdrant.Vectors
end

defmodule Qdrantex.Pb.Qdrant.SearchResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.ScoredPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.BatchResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.ScoredPoint
end

defmodule Qdrantex.Pb.Qdrant.SearchBatchResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.BatchResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.CountResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Pb.Qdrant.CountResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.ScrollResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :next_page_offset, 1,
    proto3_optional: true,
    type: Qdrantex.Pb.Qdrant.PointId,
    json_name: "nextPageOffset"

  field :result, 2, repeated: true, type: Qdrantex.Pb.Qdrant.RetrievedPoint
  field :time, 3, type: :double
end

defmodule Qdrantex.Pb.Qdrant.CountResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :count, 1, type: :uint64
end

defmodule Qdrantex.Pb.Qdrant.RetrievedPoint.PayloadEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Value
end

defmodule Qdrantex.Pb.Qdrant.RetrievedPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Pb.Qdrant.PointId

  field :payload, 2,
    repeated: true,
    type: Qdrantex.Pb.Qdrant.RetrievedPoint.PayloadEntry,
    map: true

  field :vectors, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.Vectors
end

defmodule Qdrantex.Pb.Qdrant.GetResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.RetrievedPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.RecommendResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.ScoredPoint
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.RecommendBatchResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, repeated: true, type: Qdrantex.Pb.Qdrant.BatchResult
  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.Filter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :should, 1, repeated: true, type: Qdrantex.Pb.Qdrant.Condition
  field :must, 2, repeated: true, type: Qdrantex.Pb.Qdrant.Condition
  field :must_not, 3, repeated: true, type: Qdrantex.Pb.Qdrant.Condition, json_name: "mustNot"
end

defmodule Qdrantex.Pb.Qdrant.Condition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :condition_one_of, 0

  field :field, 1, type: Qdrantex.Pb.Qdrant.FieldCondition, oneof: 0
  field :is_empty, 2, type: Qdrantex.Pb.Qdrant.IsEmptyCondition, json_name: "isEmpty", oneof: 0
  field :has_id, 3, type: Qdrantex.Pb.Qdrant.HasIdCondition, json_name: "hasId", oneof: 0
  field :filter, 4, type: Qdrantex.Pb.Qdrant.Filter, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.IsEmptyCondition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
end

defmodule Qdrantex.Pb.Qdrant.HasIdCondition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :has_id, 1, repeated: true, type: Qdrantex.Pb.Qdrant.PointId, json_name: "hasId"
end

defmodule Qdrantex.Pb.Qdrant.FieldCondition do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :match, 2, type: Qdrantex.Pb.Qdrant.Match
  field :range, 3, type: Qdrantex.Pb.Qdrant.Range
  field :geo_bounding_box, 4, type: Qdrantex.Pb.Qdrant.GeoBoundingBox, json_name: "geoBoundingBox"
  field :geo_radius, 5, type: Qdrantex.Pb.Qdrant.GeoRadius, json_name: "geoRadius"
  field :values_count, 6, type: Qdrantex.Pb.Qdrant.ValuesCount, json_name: "valuesCount"
end

defmodule Qdrantex.Pb.Qdrant.Match do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :match_value, 0

  field :keyword, 1, type: :string, oneof: 0
  field :integer, 2, type: :int64, oneof: 0
  field :boolean, 3, type: :bool, oneof: 0
  field :text, 4, type: :string, oneof: 0
  field :keywords, 5, type: Qdrantex.Pb.Qdrant.RepeatedStrings, oneof: 0
  field :integers, 6, type: Qdrantex.Pb.Qdrant.RepeatedIntegers, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.RepeatedStrings do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :strings, 1, repeated: true, type: :string
end

defmodule Qdrantex.Pb.Qdrant.RepeatedIntegers do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :integers, 1, repeated: true, type: :int64
end

defmodule Qdrantex.Pb.Qdrant.Range do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :lt, 1, proto3_optional: true, type: :double
  field :gt, 2, proto3_optional: true, type: :double
  field :gte, 3, proto3_optional: true, type: :double
  field :lte, 4, proto3_optional: true, type: :double
end

defmodule Qdrantex.Pb.Qdrant.GeoBoundingBox do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :top_left, 1, type: Qdrantex.Pb.Qdrant.GeoPoint, json_name: "topLeft"
  field :bottom_right, 2, type: Qdrantex.Pb.Qdrant.GeoPoint, json_name: "bottomRight"
end

defmodule Qdrantex.Pb.Qdrant.GeoRadius do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :center, 1, type: Qdrantex.Pb.Qdrant.GeoPoint
  field :radius, 2, type: :float
end

defmodule Qdrantex.Pb.Qdrant.ValuesCount do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :lt, 1, proto3_optional: true, type: :uint64
  field :gt, 2, proto3_optional: true, type: :uint64
  field :gte, 3, proto3_optional: true, type: :uint64
  field :lte, 4, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Pb.Qdrant.PointsSelector do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :points_selector_one_of, 0

  field :points, 1, type: Qdrantex.Pb.Qdrant.PointsIdsList, oneof: 0
  field :filter, 2, type: Qdrantex.Pb.Qdrant.Filter, oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.PointsIdsList do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :ids, 1, repeated: true, type: Qdrantex.Pb.Qdrant.PointId
end

defmodule Qdrantex.Pb.Qdrant.PointStruct.PayloadEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Value
end

defmodule Qdrantex.Pb.Qdrant.PointStruct do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: Qdrantex.Pb.Qdrant.PointId
  field :payload, 3, repeated: true, type: Qdrantex.Pb.Qdrant.PointStruct.PayloadEntry, map: true
  field :vectors, 4, proto3_optional: true, type: Qdrantex.Pb.Qdrant.Vectors
end

defmodule Qdrantex.Pb.Qdrant.GeoPoint do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :lon, 1, type: :double
  field :lat, 2, type: :double
end