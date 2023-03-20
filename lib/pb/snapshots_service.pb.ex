defmodule Qdrant.CreateFullSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrant.ListFullSnapshotsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrant.DeleteFullSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_name, 1, type: :string, json_name: "snapshotName"
end

defmodule Qdrant.CreateSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrant.ListSnapshotsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrant.DeleteSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :snapshot_name, 2, type: :string, json_name: "snapshotName"
end

defmodule Qdrant.SnapshotDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :name, 1, type: :string
  field :creation_time, 2, type: Google.Protobuf.Timestamp, json_name: "creationTime"
  field :size, 3, type: :int64
end

defmodule Qdrant.CreateSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_description, 1,
    type: Qdrant.SnapshotDescription,
    json_name: "snapshotDescription"

  field :time, 2, type: :double
end

defmodule Qdrant.ListSnapshotsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_descriptions, 1,
    repeated: true,
    type: Qdrant.SnapshotDescription,
    json_name: "snapshotDescriptions"

  field :time, 2, type: :double
end

defmodule Qdrant.DeleteSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :time, 1, type: :double
end

defmodule Qdrant.Snapshots.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Snapshots", protoc_gen_elixir_version: "0.11.0"

  rpc :Create, Qdrant.CreateSnapshotRequest, Qdrant.CreateSnapshotResponse

  rpc :List, Qdrant.ListSnapshotsRequest, Qdrant.ListSnapshotsResponse

  rpc :Delete, Qdrant.DeleteSnapshotRequest, Qdrant.DeleteSnapshotResponse

  rpc :CreateFull, Qdrant.CreateFullSnapshotRequest, Qdrant.CreateSnapshotResponse

  rpc :ListFull, Qdrant.ListFullSnapshotsRequest, Qdrant.ListSnapshotsResponse

  rpc :DeleteFull, Qdrant.DeleteFullSnapshotRequest, Qdrant.DeleteSnapshotResponse
end

defmodule Qdrant.Snapshots.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrant.Snapshots.Service
end