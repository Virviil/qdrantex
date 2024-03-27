defmodule Qdrantex.Qdrant.Collections.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.Collections", protoc_gen_elixir_version: "0.12.0"

  rpc :Get, Qdrantex.Qdrant.GetCollectionInfoRequest, Qdrantex.Qdrant.GetCollectionInfoResponse

  rpc :List, Qdrantex.Qdrant.ListCollectionsRequest, Qdrantex.Qdrant.ListCollectionsResponse

  rpc :Create, Qdrantex.Qdrant.CreateCollection, Qdrantex.Qdrant.CollectionOperationResponse

  rpc :Update, Qdrantex.Qdrant.UpdateCollection, Qdrantex.Qdrant.CollectionOperationResponse

  rpc :Delete, Qdrantex.Qdrant.DeleteCollection, Qdrantex.Qdrant.CollectionOperationResponse

  rpc :UpdateAliases, Qdrantex.Qdrant.ChangeAliases, Qdrantex.Qdrant.CollectionOperationResponse

  rpc :ListCollectionAliases,
      Qdrantex.Qdrant.ListCollectionAliasesRequest,
      Qdrantex.Qdrant.ListAliasesResponse

  rpc :ListAliases, Qdrantex.Qdrant.ListAliasesRequest, Qdrantex.Qdrant.ListAliasesResponse

  rpc :CollectionClusterInfo,
      Qdrantex.Qdrant.CollectionClusterInfoRequest,
      Qdrantex.Qdrant.CollectionClusterInfoResponse

  rpc :CollectionExists,
      Qdrantex.Qdrant.CollectionExistsRequest,
      Qdrantex.Qdrant.CollectionExistsResponse

  rpc :UpdateCollectionClusterSetup,
      Qdrantex.Qdrant.UpdateCollectionClusterSetupRequest,
      Qdrantex.Qdrant.UpdateCollectionClusterSetupResponse

  rpc :CreateShardKey,
      Qdrantex.Qdrant.CreateShardKeyRequest,
      Qdrantex.Qdrant.CreateShardKeyResponse

  rpc :DeleteShardKey,
      Qdrantex.Qdrant.DeleteShardKeyRequest,
      Qdrantex.Qdrant.DeleteShardKeyResponse
end

defmodule Qdrantex.Qdrant.Collections.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.Collections.Service
end