defmodule Qdrantex.Qdrant.CreateFullSnapshotRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.ListFullSnapshotsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Qdrantex.Qdrant.DeleteFullSnapshotRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :snapshot_name, 1, type: :string, json_name: "snapshotName"
end

defmodule Qdrantex.Qdrant.CreateSnapshotRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.ListSnapshotsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Qdrant.DeleteSnapshotRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :snapshot_name, 2, type: :string, json_name: "snapshotName"
end

defmodule Qdrantex.Qdrant.SnapshotDescription do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string
  field :creation_time, 2, type: Google.Protobuf.Timestamp, json_name: "creationTime"
  field :size, 3, type: :int64
  field :checksum, 4, proto3_optional: true, type: :string
end

defmodule Qdrantex.Qdrant.CreateSnapshotResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :snapshot_description, 1,
    type: Qdrantex.Qdrant.SnapshotDescription,
    json_name: "snapshotDescription"

  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.ListSnapshotsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :snapshot_descriptions, 1,
    repeated: true,
    type: Qdrantex.Qdrant.SnapshotDescription,
    json_name: "snapshotDescriptions"

  field :time, 2, type: :double
end

defmodule Qdrantex.Qdrant.DeleteSnapshotResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :time, 1, type: :double
end

defmodule Qdrantex.Qdrant.Snapshots.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.Snapshots", protoc_gen_elixir_version: "0.12.0"

  rpc :Create, Qdrantex.Qdrant.CreateSnapshotRequest, Qdrantex.Qdrant.CreateSnapshotResponse

  rpc :List, Qdrantex.Qdrant.ListSnapshotsRequest, Qdrantex.Qdrant.ListSnapshotsResponse

  rpc :Delete, Qdrantex.Qdrant.DeleteSnapshotRequest, Qdrantex.Qdrant.DeleteSnapshotResponse

  rpc :CreateFull,
      Qdrantex.Qdrant.CreateFullSnapshotRequest,
      Qdrantex.Qdrant.CreateSnapshotResponse

  rpc :ListFull, Qdrantex.Qdrant.ListFullSnapshotsRequest, Qdrantex.Qdrant.ListSnapshotsResponse

  rpc :DeleteFull,
      Qdrantex.Qdrant.DeleteFullSnapshotRequest,
      Qdrantex.Qdrant.DeleteSnapshotResponse
end

defmodule Qdrantex.Qdrant.Snapshots.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.Snapshots.Service
end