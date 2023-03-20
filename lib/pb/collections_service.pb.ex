defmodule Qdrant.Collections.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Collections", protoc_gen_elixir_version: "0.11.0"

  rpc :Get, Qdrant.GetCollectionInfoRequest, Qdrant.GetCollectionInfoResponse

  rpc :List, Qdrant.ListCollectionsRequest, Qdrant.ListCollectionsResponse

  rpc :Create, Qdrant.CreateCollection, Qdrant.CollectionOperationResponse

  rpc :Update, Qdrant.UpdateCollection, Qdrant.CollectionOperationResponse

  rpc :Delete, Qdrant.DeleteCollection, Qdrant.CollectionOperationResponse

  rpc :UpdateAliases, Qdrant.ChangeAliases, Qdrant.CollectionOperationResponse

  rpc :ListCollectionAliases, Qdrant.ListCollectionAliasesRequest, Qdrant.ListAliasesResponse

  rpc :ListAliases, Qdrant.ListAliasesRequest, Qdrant.ListAliasesResponse
end

defmodule Qdrant.Collections.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrant.Collections.Service
end