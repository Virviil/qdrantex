defmodule Qdrantex.Qdrant.Points.Service do
  @moduledoc false

  use GRPC.Service, name: "qdrant.Points", protoc_gen_elixir_version: "0.12.0"

  rpc :Upsert, Qdrantex.Qdrant.UpsertPoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :Delete, Qdrantex.Qdrant.DeletePoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :Get, Qdrantex.Qdrant.GetPoints, Qdrantex.Qdrant.GetResponse

  rpc :UpdateVectors, Qdrantex.Qdrant.UpdatePointVectors, Qdrantex.Qdrant.PointsOperationResponse

  rpc :DeleteVectors, Qdrantex.Qdrant.DeletePointVectors, Qdrantex.Qdrant.PointsOperationResponse

  rpc :SetPayload, Qdrantex.Qdrant.SetPayloadPoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :OverwritePayload, Qdrantex.Qdrant.SetPayloadPoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :DeletePayload, Qdrantex.Qdrant.DeletePayloadPoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :ClearPayload, Qdrantex.Qdrant.ClearPayloadPoints, Qdrantex.Qdrant.PointsOperationResponse

  rpc :CreateFieldIndex,
      Qdrantex.Qdrant.CreateFieldIndexCollection,
      Qdrantex.Qdrant.PointsOperationResponse

  rpc :DeleteFieldIndex,
      Qdrantex.Qdrant.DeleteFieldIndexCollection,
      Qdrantex.Qdrant.PointsOperationResponse

  rpc :Search, Qdrantex.Qdrant.SearchPoints, Qdrantex.Qdrant.SearchResponse

  rpc :SearchBatch, Qdrantex.Qdrant.SearchBatchPoints, Qdrantex.Qdrant.SearchBatchResponse

  rpc :SearchGroups, Qdrantex.Qdrant.SearchPointGroups, Qdrantex.Qdrant.SearchGroupsResponse

  rpc :Scroll, Qdrantex.Qdrant.ScrollPoints, Qdrantex.Qdrant.ScrollResponse

  rpc :Recommend, Qdrantex.Qdrant.RecommendPoints, Qdrantex.Qdrant.RecommendResponse

  rpc :RecommendBatch,
      Qdrantex.Qdrant.RecommendBatchPoints,
      Qdrantex.Qdrant.RecommendBatchResponse

  rpc :RecommendGroups,
      Qdrantex.Qdrant.RecommendPointGroups,
      Qdrantex.Qdrant.RecommendGroupsResponse

  rpc :Discover, Qdrantex.Qdrant.DiscoverPoints, Qdrantex.Qdrant.DiscoverResponse

  rpc :DiscoverBatch, Qdrantex.Qdrant.DiscoverBatchPoints, Qdrantex.Qdrant.DiscoverBatchResponse

  rpc :Count, Qdrantex.Qdrant.CountPoints, Qdrantex.Qdrant.CountResponse

  rpc :UpdateBatch, Qdrantex.Qdrant.UpdateBatchPoints, Qdrantex.Qdrant.UpdateBatchResponse
end

defmodule Qdrantex.Qdrant.Points.Stub do
  @moduledoc false

  use GRPC.Stub, service: Qdrantex.Qdrant.Points.Service
end