defmodule Qdrant.Points.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Points", protoc_gen_elixir_version: "0.11.0"

  rpc :Upsert, Qdrant.UpsertPoints, Qdrant.PointsOperationResponse

  rpc :Delete, Qdrant.DeletePoints, Qdrant.PointsOperationResponse

  rpc :Get, Qdrant.GetPoints, Qdrant.GetResponse

  rpc :SetPayload, Qdrant.SetPayloadPoints, Qdrant.PointsOperationResponse

  rpc :OverwritePayload, Qdrant.SetPayloadPoints, Qdrant.PointsOperationResponse

  rpc :DeletePayload, Qdrant.DeletePayloadPoints, Qdrant.PointsOperationResponse

  rpc :ClearPayload, Qdrant.ClearPayloadPoints, Qdrant.PointsOperationResponse

  rpc :CreateFieldIndex, Qdrant.CreateFieldIndexCollection, Qdrant.PointsOperationResponse

  rpc :DeleteFieldIndex, Qdrant.DeleteFieldIndexCollection, Qdrant.PointsOperationResponse

  rpc :Search, Qdrant.SearchPoints, Qdrant.SearchResponse

  rpc :SearchBatch, Qdrant.SearchBatchPoints, Qdrant.SearchBatchResponse

  rpc :Scroll, Qdrant.ScrollPoints, Qdrant.ScrollResponse

  rpc :Recommend, Qdrant.RecommendPoints, Qdrant.RecommendResponse

  rpc :RecommendBatch, Qdrant.RecommendBatchPoints, Qdrant.RecommendBatchResponse

  rpc :Count, Qdrant.CountPoints, Qdrant.CountResponse
end

defmodule Qdrant.Points.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrant.Points.Service
end