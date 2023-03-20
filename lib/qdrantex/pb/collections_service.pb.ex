defmodule Qdrantex.Pb.Qdrant.Collections.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Collections", protoc_gen_elixir_version: "0.11.0"

  rpc :Get,
      Qdrantex.Pb.Qdrant.GetCollectionInfoRequest,
      Qdrantex.Pb.Qdrant.GetCollectionInfoResponse

  rpc :List, Qdrantex.Pb.Qdrant.ListCollectionsRequest, Qdrantex.Pb.Qdrant.ListCollectionsResponse

  rpc :Create, Qdrantex.Pb.Qdrant.CreateCollection, Qdrantex.Pb.Qdrant.CollectionOperationResponse

  rpc :Update, Qdrantex.Pb.Qdrant.UpdateCollection, Qdrantex.Pb.Qdrant.CollectionOperationResponse

  rpc :Delete, Qdrantex.Pb.Qdrant.DeleteCollection, Qdrantex.Pb.Qdrant.CollectionOperationResponse

  rpc :UpdateAliases,
      Qdrantex.Pb.Qdrant.ChangeAliases,
      Qdrantex.Pb.Qdrant.CollectionOperationResponse

  rpc :ListCollectionAliases,
      Qdrantex.Pb.Qdrant.ListCollectionAliasesRequest,
      Qdrantex.Pb.Qdrant.ListAliasesResponse

  rpc :ListAliases, Qdrantex.Pb.Qdrant.ListAliasesRequest, Qdrantex.Pb.Qdrant.ListAliasesResponse
end

defmodule Qdrantex.Pb.Qdrant.Collections.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrantex.Pb.Qdrant.Collections.Service
end