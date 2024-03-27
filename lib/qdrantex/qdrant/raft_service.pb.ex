defmodule Qdrantex.Qdrant.RaftMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :message, 1, type: :bytes
end

defmodule Qdrantex.Qdrant.AllPeers do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :all_peers, 1, repeated: true, type: Qdrantex.Qdrant.Peer, json_name: "allPeers"
  field :first_peer_id, 2, type: :uint64, json_name: "firstPeerId"
end

defmodule Qdrantex.Qdrant.Peer do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :uri, 1, type: :string
  field :id, 2, type: :uint64
end

defmodule Qdrantex.Qdrant.AddPeerToKnownMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :uri, 1, proto3_optional: true, type: :string
  field :port, 2, proto3_optional: true, type: :uint32
  field :id, 3, type: :uint64
end

defmodule Qdrantex.Qdrant.PeerId do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :uint64
end

defmodule Qdrantex.Qdrant.Uri do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :uri, 1, type: :string
end

defmodule Qdrantex.Qdrant.Raft.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.Raft", protoc_gen_elixir_version: "0.12.0"

  rpc :Send, Qdrantex.Qdrant.RaftMessage, Google.Protobuf.Empty

  rpc :WhoIs, Qdrantex.Qdrant.PeerId, Qdrantex.Qdrant.Uri

  rpc :AddPeerToKnown, Qdrantex.Qdrant.AddPeerToKnownMessage, Qdrantex.Qdrant.AllPeers

  rpc :AddPeerAsParticipant, Qdrantex.Qdrant.PeerId, Google.Protobuf.Empty
end

defmodule Qdrantex.Qdrant.Raft.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.Raft.Service
end