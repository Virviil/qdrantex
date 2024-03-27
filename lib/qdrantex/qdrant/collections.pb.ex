defmodule Qdrantex.Qdrant.Distance do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UnknownDistance, 0
  field :Cosine, 1
  field :Euclid, 2
  field :Dot, 3
  field :Manhattan, 4
end

defmodule Qdrantex.Qdrant.CollectionStatus do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UnknownCollectionStatus, 0
  field :Green, 1
  field :Yellow, 2
  field :Red, 3
end

defmodule Qdrantex.Qdrant.PayloadSchemaType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UnknownType, 0
  field :Keyword, 1
  field :Integer, 2
  field :Float, 3
  field :Geo, 4
  field :Text, 5
  field :Bool, 6
  field :Datetime, 7
end

defmodule Qdrantex.Qdrant.QuantizationType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :UnknownQuantization, 0
  field :Int8, 1
end

defmodule Qdrantex.Qdrant.CompressionRatio do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :x4, 0
  field :x8, 1
  field :x16, 2
  field :x32, 3
  field :x64, 4
end

defmodule Qdrantex.Qdrant.ShardingMethod do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :Auto, 0
  field :Custom, 1
end

defmodule Qdrantex.Qdrant.TokenizerType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :Unknown, 0
  field :Prefix, 1
  field :Whitespace, 2
  field :Word, 3
  field :Multilingual, 4
end

defmodule Qdrantex.Qdrant.ReplicaState do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :Active, 0
  field :Dead, 1
  field :Partial, 2
  field :Initializing, 3
  field :Listener, 4
  field :PartialSnapshot, 5
  field :Recovery, 6
end

defmodule Qdrantex.Qdrant.ShardTransferMethod do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :StreamRecords, 0
  field :Snapshot, 1
  field :WalDelta, 2
end

defmodule Qdrantex.Qdrant.VectorParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :size, 1, type: :uint64
  field :distance, 2, type: Qdrantex.Qdrant.Distance, enum: true

  field :hnsw_config, 3,
    proto3_optional: true,
    type: Qdrantex.Qdrant.HnswConfigDiff,
    json_name: "hnswConfig"

  field :quantization_config, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.QuantizationConfig,
    json_name: "quantizationConfig"

  field :on_disk, 5, proto3_optional: true, type: :bool, json_name: "onDisk"
end

defmodule Qdrantex.Qdrant.VectorParamsDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :hnsw_config, 1,
    proto3_optional: true,
    type: Qdrantex.Qdrant.HnswConfigDiff,
    json_name: "hnswConfig"

  field :quantization_config, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.QuantizationConfigDiff,
    json_name: "quantizationConfig"

  field :on_disk, 3, proto3_optional: true, type: :bool, json_name: "onDisk"
end

defmodule Qdrantex.Qdrant.VectorParamsMap.MapEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.VectorParams
end

defmodule Qdrantex.Qdrant.VectorParamsMap do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :map, 1, repeated: true, type: Qdrantex.Qdrant.VectorParamsMap.MapEntry, map: true
end

defmodule Qdrantex.Qdrant.VectorParamsDiffMap.MapEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.VectorParamsDiff
end

defmodule Qdrantex.Qdrant.VectorParamsDiffMap do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :map, 1, repeated: true, type: Qdrantex.Qdrant.VectorParamsDiffMap.MapEntry, map: true
end

defmodule Qdrantex.Qdrant.VectorsConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :config, 0

  field :params, 1, type: Qdrantex.Qdrant.VectorParams, oneof: 0
  field :params_map, 2, type: Qdrantex.Qdrant.VectorParamsMap, json_name: "paramsMap", oneof: 0
end

defmodule Qdrantex.Qdrant.VectorsConfigDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :config, 0

  field :params, 1, type: Qdrantex.Qdrant.VectorParamsDiff, oneof: 0

  field :params_map, 2,
    type: Qdrantex.Qdrant.VectorParamsDiffMap,
    json_name: "paramsMap",
    oneof: 0
end

defmodule Qdrantex.Qdrant.SparseVectorParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :index, 1, proto3_optional: true, type: Qdrantex.Qdrant.SparseIndexConfig
end

defmodule Qdrantex.Qdrant.SparseVectorConfig.MapEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.SparseVectorParams
end

defmodule Qdrantex.Qdrant.SparseVectorConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :map, 1, repeated: true, type: Qdrantex.Qdrant.SparseVectorConfig.MapEntry, map: true
end

defmodule Qdrantex.Qdrant.GetCollectionInfoRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.CollectionExistsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.CollectionExists do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :exists, 1, type: :bool
end

defmodule Qdrantex.Qdrant.CollectionExistsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.CollectionExists
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.ListCollectionsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.CollectionDescription do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Qdrantex.Qdrant.GetCollectionInfoResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: Qdrantex.Qdrant.CollectionInfo
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.ListCollectionsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collections, 1, repeated: true, type: Qdrantex.Qdrant.CollectionDescription
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.OptimizerStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ok, 1, type: :bool
  field :error, 2, type: :string
end

defmodule Qdrantex.Qdrant.HnswConfigDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

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

defmodule Qdrantex.Qdrant.SparseIndexConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :full_scan_threshold, 1,
    proto3_optional: true,
    type: :uint64,
    json_name: "fullScanThreshold"

  field :on_disk, 2, proto3_optional: true, type: :bool, json_name: "onDisk"
end

defmodule Qdrantex.Qdrant.WalConfigDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :wal_capacity_mb, 1, proto3_optional: true, type: :uint64, json_name: "walCapacityMb"

  field :wal_segments_ahead, 2,
    proto3_optional: true,
    type: :uint64,
    json_name: "walSegmentsAhead"
end

defmodule Qdrantex.Qdrant.OptimizersConfigDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

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

defmodule Qdrantex.Qdrant.ScalarQuantization do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :type, 1, type: Qdrantex.Qdrant.QuantizationType, enum: true
  field :quantile, 2, proto3_optional: true, type: :float
  field :always_ram, 3, proto3_optional: true, type: :bool, json_name: "alwaysRam"
end

defmodule Qdrantex.Qdrant.ProductQuantization do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :compression, 1, type: Qdrantex.Qdrant.CompressionRatio, enum: true
  field :always_ram, 2, proto3_optional: true, type: :bool, json_name: "alwaysRam"
end

defmodule Qdrantex.Qdrant.BinaryQuantization do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :always_ram, 1, proto3_optional: true, type: :bool, json_name: "alwaysRam"
end

defmodule Qdrantex.Qdrant.QuantizationConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :quantization, 0

  field :scalar, 1, type: Qdrantex.Qdrant.ScalarQuantization, oneof: 0
  field :product, 2, type: Qdrantex.Qdrant.ProductQuantization, oneof: 0
  field :binary, 3, type: Qdrantex.Qdrant.BinaryQuantization, oneof: 0
end

defmodule Qdrantex.Qdrant.Disabled do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.QuantizationConfigDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :quantization, 0

  field :scalar, 1, type: Qdrantex.Qdrant.ScalarQuantization, oneof: 0
  field :product, 2, type: Qdrantex.Qdrant.ProductQuantization, oneof: 0
  field :disabled, 3, type: Qdrantex.Qdrant.Disabled, oneof: 0
  field :binary, 4, type: Qdrantex.Qdrant.BinaryQuantization, oneof: 0
end

defmodule Qdrantex.Qdrant.CreateCollection do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :hnsw_config, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.HnswConfigDiff,
    json_name: "hnswConfig"

  field :wal_config, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.WalConfigDiff,
    json_name: "walConfig"

  field :optimizers_config, 6,
    proto3_optional: true,
    type: Qdrantex.Qdrant.OptimizersConfigDiff,
    json_name: "optimizersConfig"

  field :shard_number, 7, proto3_optional: true, type: :uint32, json_name: "shardNumber"
  field :on_disk_payload, 8, proto3_optional: true, type: :bool, json_name: "onDiskPayload"
  field :timeout, 9, proto3_optional: true, type: :uint64

  field :vectors_config, 10,
    proto3_optional: true,
    type: Qdrantex.Qdrant.VectorsConfig,
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
    type: Qdrantex.Qdrant.QuantizationConfig,
    json_name: "quantizationConfig"

  field :sharding_method, 15,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardingMethod,
    json_name: "shardingMethod",
    enum: true

  field :sparse_vectors_config, 16,
    proto3_optional: true,
    type: Qdrantex.Qdrant.SparseVectorConfig,
    json_name: "sparseVectorsConfig"
end

defmodule Qdrantex.Qdrant.UpdateCollection do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"

  field :optimizers_config, 2,
    proto3_optional: true,
    type: Qdrantex.Qdrant.OptimizersConfigDiff,
    json_name: "optimizersConfig"

  field :timeout, 3, proto3_optional: true, type: :uint64
  field :params, 4, proto3_optional: true, type: Qdrantex.Qdrant.CollectionParamsDiff

  field :hnsw_config, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.HnswConfigDiff,
    json_name: "hnswConfig"

  field :vectors_config, 6,
    proto3_optional: true,
    type: Qdrantex.Qdrant.VectorsConfigDiff,
    json_name: "vectorsConfig"

  field :quantization_config, 7,
    proto3_optional: true,
    type: Qdrantex.Qdrant.QuantizationConfigDiff,
    json_name: "quantizationConfig"

  field :sparse_vectors_config, 8,
    proto3_optional: true,
    type: Qdrantex.Qdrant.SparseVectorConfig,
    json_name: "sparseVectorsConfig"
end

defmodule Qdrantex.Qdrant.DeleteCollection do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :timeout, 2, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.CollectionOperationResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: :bool
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.CollectionParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_number, 3, type: :uint32, json_name: "shardNumber"
  field :on_disk_payload, 4, type: :bool, json_name: "onDiskPayload"

  field :vectors_config, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.VectorsConfig,
    json_name: "vectorsConfig"

  field :replication_factor, 6,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :write_consistency_factor, 7,
    proto3_optional: true,
    type: :uint32,
    json_name: "writeConsistencyFactor"

  field :read_fan_out_factor, 8,
    proto3_optional: true,
    type: :uint32,
    json_name: "readFanOutFactor"

  field :sharding_method, 9,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardingMethod,
    json_name: "shardingMethod",
    enum: true

  field :sparse_vectors_config, 10,
    proto3_optional: true,
    type: Qdrantex.Qdrant.SparseVectorConfig,
    json_name: "sparseVectorsConfig"
end

defmodule Qdrantex.Qdrant.CollectionParamsDiff do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :replication_factor, 1,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :write_consistency_factor, 2,
    proto3_optional: true,
    type: :uint32,
    json_name: "writeConsistencyFactor"

  field :on_disk_payload, 3, proto3_optional: true, type: :bool, json_name: "onDiskPayload"

  field :read_fan_out_factor, 4,
    proto3_optional: true,
    type: :uint32,
    json_name: "readFanOutFactor"
end

defmodule Qdrantex.Qdrant.CollectionConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :params, 1, type: Qdrantex.Qdrant.CollectionParams
  field :hnsw_config, 2, type: Qdrantex.Qdrant.HnswConfigDiff, json_name: "hnswConfig"

  field :optimizer_config, 3,
    type: Qdrantex.Qdrant.OptimizersConfigDiff,
    json_name: "optimizerConfig"

  field :wal_config, 4, type: Qdrantex.Qdrant.WalConfigDiff, json_name: "walConfig"

  field :quantization_config, 5,
    proto3_optional: true,
    type: Qdrantex.Qdrant.QuantizationConfig,
    json_name: "quantizationConfig"
end

defmodule Qdrantex.Qdrant.TextIndexParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :tokenizer, 1, type: Qdrantex.Qdrant.TokenizerType, enum: true
  field :lowercase, 2, proto3_optional: true, type: :bool
  field :min_token_len, 3, proto3_optional: true, type: :uint64, json_name: "minTokenLen"
  field :max_token_len, 4, proto3_optional: true, type: :uint64, json_name: "maxTokenLen"
end

defmodule Qdrantex.Qdrant.IntegerIndexParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :lookup, 1, type: :bool
  field :range, 2, type: :bool
end

defmodule Qdrantex.Qdrant.PayloadIndexParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :index_params, 0

  field :text_index_params, 1,
    type: Qdrantex.Qdrant.TextIndexParams,
    json_name: "textIndexParams",
    oneof: 0

  field :integer_index_params, 2,
    type: Qdrantex.Qdrant.IntegerIndexParams,
    json_name: "integerIndexParams",
    oneof: 0
end

defmodule Qdrantex.Qdrant.PayloadSchemaInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :data_type, 1, type: Qdrantex.Qdrant.PayloadSchemaType, json_name: "dataType", enum: true
  field :params, 2, proto3_optional: true, type: Qdrantex.Qdrant.PayloadIndexParams
  field :points, 3, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.CollectionInfo.PayloadSchemaEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Qdrant.PayloadSchemaInfo
end

defmodule Qdrantex.Qdrant.CollectionInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :status, 1, type: Qdrantex.Qdrant.CollectionStatus, enum: true
  field :optimizer_status, 2, type: Qdrantex.Qdrant.OptimizerStatus, json_name: "optimizerStatus"
  field :vectors_count, 3, proto3_optional: true, type: :uint64, json_name: "vectorsCount"
  field :segments_count, 4, type: :uint64, json_name: "segmentsCount"
  field :config, 7, type: Qdrantex.Qdrant.CollectionConfig

  field :payload_schema, 8,
    repeated: true,
    type: Qdrantex.Qdrant.CollectionInfo.PayloadSchemaEntry,
    json_name: "payloadSchema",
    map: true

  field :points_count, 9, proto3_optional: true, type: :uint64, json_name: "pointsCount"

  field :indexed_vectors_count, 10,
    proto3_optional: true,
    type: :uint64,
    json_name: "indexedVectorsCount"
end

defmodule Qdrantex.Qdrant.ChangeAliases do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :actions, 1, repeated: true, type: Qdrantex.Qdrant.AliasOperations
  field :timeout, 2, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.AliasOperations do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :action, 0

  field :create_alias, 1, type: Qdrantex.Qdrant.CreateAlias, json_name: "createAlias", oneof: 0
  field :rename_alias, 2, type: Qdrantex.Qdrant.RenameAlias, json_name: "renameAlias", oneof: 0
  field :delete_alias, 3, type: Qdrantex.Qdrant.DeleteAlias, json_name: "deleteAlias", oneof: 0
end

defmodule Qdrantex.Qdrant.CreateAlias do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :alias_name, 2, type: :string, json_name: "aliasName"
end

defmodule Qdrantex.Qdrant.RenameAlias do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :old_alias_name, 1, type: :string, json_name: "oldAliasName"
  field :new_alias_name, 2, type: :string, json_name: "newAliasName"
end

defmodule Qdrantex.Qdrant.DeleteAlias do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :alias_name, 1, type: :string, json_name: "aliasName"
end

defmodule Qdrantex.Qdrant.ListAliasesRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.ListCollectionAliasesRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.AliasDescription do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :alias_name, 1, type: :string, json_name: "aliasName"
  field :collection_name, 2, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.ListAliasesResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :aliases, 1, repeated: true, type: Qdrantex.Qdrant.AliasDescription
  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.CollectionClusterInfoRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.ShardKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :key, 0

  field :keyword, 1, type: :string, oneof: 0
  field :number, 2, type: :uint64, oneof: 0
end

defmodule Qdrantex.Qdrant.LocalShardInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :points_count, 2, type: :uint64, json_name: "pointsCount"
  field :state, 3, type: Qdrantex.Qdrant.ReplicaState, enum: true

  field :shard_key, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKey,
    json_name: "shardKey"
end

defmodule Qdrantex.Qdrant.RemoteShardInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :peer_id, 2, type: :uint64, json_name: "peerId"
  field :state, 3, type: Qdrantex.Qdrant.ReplicaState, enum: true

  field :shard_key, 4,
    proto3_optional: true,
    type: Qdrantex.Qdrant.ShardKey,
    json_name: "shardKey"
end

defmodule Qdrantex.Qdrant.ShardTransferInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :from, 2, type: :uint64
  field :to, 3, type: :uint64
  field :sync, 4, type: :bool
end

defmodule Qdrantex.Qdrant.CollectionClusterInfoResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :peer_id, 1, type: :uint64, json_name: "peerId"
  field :shard_count, 2, type: :uint64, json_name: "shardCount"

  field :local_shards, 3,
    repeated: true,
    type: Qdrantex.Qdrant.LocalShardInfo,
    json_name: "localShards"

  field :remote_shards, 4,
    repeated: true,
    type: Qdrantex.Qdrant.RemoteShardInfo,
    json_name: "remoteShards"

  field :shard_transfers, 5,
    repeated: true,
    type: Qdrantex.Qdrant.ShardTransferInfo,
    json_name: "shardTransfers"
end

defmodule Qdrantex.Qdrant.MoveShard do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :from_peer_id, 2, type: :uint64, json_name: "fromPeerId"
  field :to_peer_id, 3, type: :uint64, json_name: "toPeerId"
  field :method, 4, proto3_optional: true, type: Qdrantex.Qdrant.ShardTransferMethod, enum: true
end

defmodule Qdrantex.Qdrant.RestartTransfer do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :from_peer_id, 2, type: :uint64, json_name: "fromPeerId"
  field :to_peer_id, 3, type: :uint64, json_name: "toPeerId"
  field :method, 4, type: Qdrantex.Qdrant.ShardTransferMethod, enum: true
end

defmodule Qdrantex.Qdrant.Replica do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_id, 1, type: :uint32, json_name: "shardId"
  field :peer_id, 2, type: :uint64, json_name: "peerId"
end

defmodule Qdrantex.Qdrant.CreateShardKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_key, 1, type: Qdrantex.Qdrant.ShardKey, json_name: "shardKey"
  field :shards_number, 2, proto3_optional: true, type: :uint32, json_name: "shardsNumber"

  field :replication_factor, 3,
    proto3_optional: true,
    type: :uint32,
    json_name: "replicationFactor"

  field :placement, 4, repeated: true, type: :uint64
end

defmodule Qdrantex.Qdrant.DeleteShardKey do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shard_key, 1, type: Qdrantex.Qdrant.ShardKey, json_name: "shardKey"
end

defmodule Qdrantex.Qdrant.UpdateCollectionClusterSetupRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :operation, 0

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :move_shard, 2, type: Qdrantex.Qdrant.MoveShard, json_name: "moveShard", oneof: 0

  field :replicate_shard, 3,
    type: Qdrantex.Qdrant.MoveShard,
    json_name: "replicateShard",
    oneof: 0

  field :abort_transfer, 4, type: Qdrantex.Qdrant.MoveShard, json_name: "abortTransfer", oneof: 0
  field :drop_replica, 5, type: Qdrantex.Qdrant.Replica, json_name: "dropReplica", oneof: 0

  field :create_shard_key, 7,
    type: Qdrantex.Qdrant.CreateShardKey,
    json_name: "createShardKey",
    oneof: 0

  field :delete_shard_key, 8,
    type: Qdrantex.Qdrant.DeleteShardKey,
    json_name: "deleteShardKey",
    oneof: 0

  field :restart_transfer, 9,
    type: Qdrantex.Qdrant.RestartTransfer,
    json_name: "restartTransfer",
    oneof: 0

  field :timeout, 6, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.UpdateCollectionClusterSetupResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: :bool
end

defmodule Qdrantex.Qdrant.CreateShardKeyRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :request, 2, type: Qdrantex.Qdrant.CreateShardKey
  field :timeout, 3, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.DeleteShardKeyRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :request, 2, type: Qdrantex.Qdrant.DeleteShardKey
  field :timeout, 3, proto3_optional: true, type: :uint64
end

defmodule Qdrantex.Qdrant.CreateShardKeyResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: :bool
end

defmodule Qdrantex.Qdrant.DeleteShardKeyResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :result, 1, type: :bool
end