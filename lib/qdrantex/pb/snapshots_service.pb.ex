defmodule Qdrantex.Pb.Qdrant.CreateFullSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrantex.Pb.Qdrant.ListFullSnapshotsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Qdrantex.Pb.Qdrant.DeleteFullSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_name, 1, type: :string, json_name: "snapshotName"
end

defmodule Qdrantex.Pb.Qdrant.CreateSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Pb.Qdrant.ListSnapshotsRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
end

defmodule Qdrantex.Pb.Qdrant.DeleteSnapshotRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :collection_name, 1, type: :string, json_name: "collectionName"
  field :snapshot_name, 2, type: :string, json_name: "snapshotName"
end

defmodule Qdrantex.Pb.Qdrant.SnapshotDescription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :name, 1, type: :string
  field :creation_time, 2, type: Google.Protobuf.Timestamp, json_name: "creationTime"
  field :size, 3, type: :int64
end

defmodule Qdrantex.Pb.Qdrant.CreateSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_description, 1,
    type: Qdrantex.Pb.Qdrant.SnapshotDescription,
    json_name: "snapshotDescription"

  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.ListSnapshotsResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :snapshot_descriptions, 1,
    repeated: true,
    type: Qdrantex.Pb.Qdrant.SnapshotDescription,
    json_name: "snapshotDescriptions"

  field :time, 2, type: :double
end

defmodule Qdrantex.Pb.Qdrant.DeleteSnapshotResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :time, 1, type: :double
end

defmodule Qdrantex.Pb.Qdrant.Snapshots.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Snapshots", protoc_gen_elixir_version: "0.11.0"

  rpc :Create, Qdrantex.Pb.Qdrant.CreateSnapshotRequest, Qdrantex.Pb.Qdrant.CreateSnapshotResponse

  rpc :List, Qdrantex.Pb.Qdrant.ListSnapshotsRequest, Qdrantex.Pb.Qdrant.ListSnapshotsResponse

  rpc :Delete, Qdrantex.Pb.Qdrant.DeleteSnapshotRequest, Qdrantex.Pb.Qdrant.DeleteSnapshotResponse

  rpc :CreateFull,
      Qdrantex.Pb.Qdrant.CreateFullSnapshotRequest,
      Qdrantex.Pb.Qdrant.CreateSnapshotResponse

  rpc :ListFull,
      Qdrantex.Pb.Qdrant.ListFullSnapshotsRequest,
      Qdrantex.Pb.Qdrant.ListSnapshotsResponse

  rpc :DeleteFull,
      Qdrantex.Pb.Qdrant.DeleteFullSnapshotRequest,
      Qdrantex.Pb.Qdrant.DeleteSnapshotResponse
end

defmodule Qdrantex.Pb.Qdrant.Snapshots.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrantex.Pb.Qdrant.Snapshots.Service
end