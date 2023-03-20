defmodule Qdrant.Distance do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UnknownDistance, 0
  field :Cosine, 1
  field :Euclid, 2
  field :Dot, 3
end

defmodule Qdrant.CollectionStatus do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UnknownCollectionStatus, 0
  field :Green, 1
  field :Yellow, 2
  field :Red, 3
end

defmodule Qdrant.PayloadSchemaType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UnknownType, 0
  field :Keyword, 1
  field :Integer, 2
  field :Float, 3
  field :Geo, 4
  field :Text, 5
end

defmodule Qdrant.QuantizationType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :UnknownQuantization, 0
  field :Int8, 1
end

defmodule Qdrant.TokenizerType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :Unknown, 0
  field :Prefix, 1
  field :Whitespace, 2
  field :Word, 3
end

defmodule Qdrant.VectorParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :size, 1, type: :uint64
  field :distance, 2, type: Qdrant.Distance, enum: true
end

defmodule Qdrant.VectorParamsMap.MapEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrant.VectorParams
end

defmodule Qdrant.VectorParamsMap do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :map, 1, repeated: true, type: Qdrant.VectorParamsMap.MapEntry, map: true
end

defmodule Qdrant.VectorsConfig do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :config, 0

  field :params, 1, type: Qdrant.VectorParams, oneof: 0
  field :params_map, 2, type: Qdrant.VectorParamsMap, json_name: "paramsMap", oneof: 0
end

defmodule Qdrant.GetCollectionInfoRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrant.ListCollectionsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrant.CollectionDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Qdrant.GetCollectionInfoResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, type: Qdrant.CollectionInfo
  field :time, 2, type: :double
end

defmodule Qdrant.ListCollectionsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collections, 1, repeated: true, type: Qdrant.CollectionDescription
  field :time, 2, type: :double
end

defmodule Qdrant.OptimizerStatus do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :ok, 1, type: :bool
  field :error, 2, type: :string
end

defmodule Qdrant.HnswConfigDiff do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :m, 1, proto3_optional: true, type: :uint64
  field :ef_construct, 2, proto3_optional: true, type: :uint64, json_name: "efConstruct"

  field :full_scan_threshold, 3,
    proto3_optional: true,
    type: :uint64,
    json_name: "fullScanThreshold"

  field :max_indexing_threads, 4,
    proto3_optional: true,
    type: :uint64,
    json_name: "maxIndexingThreads"

  field :on_disk, 5, proto3_optional: true, type: :bool, json_name: "onDisk"
  field :payload_m, 6, proto3_optional: true, type: :uint64, json_name: "payloadM"
end

defmodule Qdrant.WalConfigDiff do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :wal_capacity_mb, 1, proto3_optional: true, type: :uint64, json_name: "walCapacityMb"

  field :wal_segments_ahead, 2,
    proto3_optional: true,
    type: :uint64,
    json_name: "walSegmentsAhead"
end

defmodule Qdrant.OptimizersConfigDiff do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :deleted_threshold, 1, proto3_optional: true, type: :double, json_name: "deletedThreshold"

  field :vacuum_min_vector_number, 2,
    proto3_optional: true,
    type: :uint64,
    json_name: "vacuumMinVectorNumber"

  field :default_segment_number, 3,
    proto3_optional: true,
    type: :uint64,
    json_name: "defaultSegmentNumber"

  field :max_segment_size, 4, proto3_optional: true, type: :uint64, json_name: "maxSegmentSize"
  field :memmap_threshold, 5, proto3_optional: true, type: :uint64, json_name: "memmapThreshold"

  field :indexing_threshold, 6,
    proto3_optional: true,
    type: :uint64,
    json_name: "indexingThreshold"

  field :flush_interval_sec, 7,
    proto3_optional: true,
    type: :uint64,
    json_name: "flushIntervalSec"

  field :max_optimization_threads, 8,
    proto3_optional: true,
    type: :uint64,
    json_name: "maxOptimizationThreads"
end

defmodule Qdrant.ScalarQuantization do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :type, 1, type: Qdrant.QuantizationType, enum: true
  field :quantile, 2, proto3_optional: true, type: :float
  field :always_ram, 3, proto3_optional: true, type: :bool, json_name: "alwaysRam"
end

defmodule Qdrant.QuantizationConfig do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :quantization, 0

  field :scalar, 1, type: Qdrant.ScalarQuantization, oneof: 0
end

defmodule Qdrant.CreateCollection do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :hnsw_config, 4,
    proto3_optional: true,
    type: Qdrant.HnswConfigDiff,
    json_name: "hnswConfig"

  field :wal_config, 5, proto3_optional: true, type: Qdrant.WalConfigDiff, json_name: "walConfig"

  field :optimizers_config, 6,
    proto3_optional: true,
    type: Qdrant.OptimizersConfigDiff,
    json_name: "optimizersConfig"

  field :shard_number, 7, proto3_optional: true, type: :uint32, json_name: "shardNumber"
  field :on_disk_payload, 8, proto3_optional: true, type: :bool, json_name: "onDiskPayload"
  field :timeout, 9, proto3_optional: true, type: :uint64

  field :vectors_config, 10,
    proto3_optional: true,
    type: Qdrant.VectorsConfig,
    json_name: "vectorsConfig"

  field :replication_factor, 11,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :write_consistency_factor, 12,
    proto3_optional: true,
    type: :uint32,
    json_name: "writeConsistencyFactor"

  field :init_from_collection, 13,
    proto3_optional: true,
    type: :string,
    json_name: "initFromCollection"

  field :quantization_config, 14,
    proto3_optional: true,
    type: Qdrant.QuantizationConfig,
    json_name: "quantizationConfig"
end

defmodule Qdrant.UpdateCollection do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :optimizers_config, 2,
    proto3_optional: true,
    type: Qdrant.OptimizersConfigDiff,
    json_name: "optimizersConfig"

  field :timeout, 3, proto3_optional: true, type: :uint64
  field :params, 4, proto3_optional: true, type: Qdrant.CollectionParamsDiff
end

defmodule Qdrant.DeleteCollection do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :timeout, 2, proto3_optional: true, type: :uint64
end

defmodule Qdrant.CollectionOperationResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :result, 1, type: :bool
  field :time, 2, type: :double
end

defmodule Qdrant.CollectionParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :shard_number, 3, type: :uint32, json_name: "shardNumber"
  field :on_disk_payload, 4, type: :bool, json_name: "onDiskPayload"

  field :vectors_config, 5,
    proto3_optional: true,
    type: Qdrant.VectorsConfig,
    json_name: "vectorsConfig"

  field :replication_factor, 6,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :write_consistency_factor, 7,
    proto3_optional: true,
    type: :uint32,
    json_name: "writeConsistencyFactor"
end

defmodule Qdrant.CollectionParamsDiff do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :replication_factor, 1,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :write_consistency_factor, 2,
    proto3_optional: true,
    type: :uint32,
    json_name: "writeConsistencyFactor"
end

defmodule Qdrant.CollectionConfig do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :params, 1, type: Qdrant.CollectionParams
  field :hnsw_config, 2, type: Qdrant.HnswConfigDiff, json_name: "hnswConfig"
  field :optimizer_config, 3, type: Qdrant.OptimizersConfigDiff, json_name: "optimizerConfig"
  field :wal_config, 4, type: Qdrant.WalConfigDiff, json_name: "walConfig"

  field :quantization_config, 5,
    proto3_optional: true,
    type: Qdrant.QuantizationConfig,
    json_name: "quantizationConfig"
end

defmodule Qdrant.TextIndexParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :tokenizer, 1, type: Qdrant.TokenizerType, enum: true
  field :lowercase, 2, proto3_optional: true, type: :bool
  field :min_token_len, 3, proto3_optional: true, type: :uint64, json_name: "minTokenLen"
  field :max_token_len, 4, proto3_optional: true, type: :uint64, json_name: "maxTokenLen"
end

defmodule Qdrant.PayloadIndexParams do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :index_params, 0

  field :text_index_params, 1,
    type: Qdrant.TextIndexParams,
    json_name: "textIndexParams",
    oneof: 0
end

defmodule Qdrant.PayloadSchemaInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :data_type, 1, type: Qdrant.PayloadSchemaType, json_name: "dataType", enum: true
  field :params, 2, proto3_optional: true, type: Qdrant.PayloadIndexParams
  field :points, 3, proto3_optional: true, type: :uint64
end

defmodule Qdrant.CollectionInfo.PayloadSchemaEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrant.PayloadSchemaInfo
end

defmodule Qdrant.CollectionInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :status, 1, type: Qdrant.CollectionStatus, enum: true
  field :optimizer_status, 2, type: Qdrant.OptimizerStatus, json_name: "optimizerStatus"
  field :vectors_count, 3, type: :uint64, json_name: "vectorsCount"
  field :segments_count, 4, type: :uint64, json_name: "segmentsCount"
  field :config, 7, type: Qdrant.CollectionConfig

  field :payload_schema, 8,
    repeated: true,
    type: Qdrant.CollectionInfo.PayloadSchemaEntry,
    json_name: "payloadSchema",
    map: true

  field :points_count, 9, type: :uint64, json_name: "pointsCount"

  field :indexed_vectors_count, 10,
    proto3_optional: true,
    type: :uint64,
    json_name: "indexedVectorsCount"
end

defmodule Qdrant.ChangeAliases do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :actions, 1, repeated: true, type: Qdrant.AliasOperations
  field :timeout, 2, proto3_optional: true, type: :uint64
end

defmodule Qdrant.AliasOperations do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :action, 0

  field :create_alias, 1, type: Qdrant.CreateAlias, json_name: "createAlias", oneof: 0
  field :rename_alias, 2, type: Qdrant.RenameAlias, json_name: "renameAlias", oneof: 0
  field :delete_alias, 3, type: Qdrant.DeleteAlias, json_name: "deleteAlias", oneof: 0
end

defmodule Qdrant.CreateAlias do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :alias_name, 2, type: :string, json_name: "aliasName"
end

defmodule Qdrant.RenameAlias do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :old_alias_name, 1, type: :string, json_name: "oldAliasName"
  field :new_alias_name, 2, type: :string, json_name: "newAliasName"
end

defmodule Qdrant.DeleteAlias do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :alias_name, 1, type: :string, json_name: "aliasName"
end

defmodule Qdrant.ListAliasesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrant.ListCollectionAliasesRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrant.AliasDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :alias_name, 1, type: :string, json_name: "aliasName"
  field :collection_name, 2, type: :string, json_name: "collectionName"
end

defmodule Qdrant.ListAliasesResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :aliases, 1, repeated: true, type: Qdrant.AliasDescription
  field :time, 2, type: :double
end