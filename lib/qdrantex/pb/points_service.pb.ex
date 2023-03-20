defmodule Qdrantex.Pb.Qdrant.Points.Service do
  @moduledoc false
  use GRPC.Service, name: "qdrant.Points", protoc_gen_elixir_version: "0.11.0"

  rpc :Upsert, Qdrantex.Pb.Qdrant.UpsertPoints, Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :Delete, Qdrantex.Pb.Qdrant.DeletePoints, Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :Get, Qdrantex.Pb.Qdrant.GetPoints, Qdrantex.Pb.Qdrant.GetResponse

  rpc :SetPayload, Qdrantex.Pb.Qdrant.SetPayloadPoints, Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :OverwritePayload,
      Qdrantex.Pb.Qdrant.SetPayloadPoints,
      Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :DeletePayload,
      Qdrantex.Pb.Qdrant.DeletePayloadPoints,
      Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :ClearPayload,
      Qdrantex.Pb.Qdrant.ClearPayloadPoints,
      Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :CreateFieldIndex,
      Qdrantex.Pb.Qdrant.CreateFieldIndexCollection,
      Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :DeleteFieldIndex,
      Qdrantex.Pb.Qdrant.DeleteFieldIndexCollection,
      Qdrantex.Pb.Qdrant.PointsOperationResponse

  rpc :Search, Qdrantex.Pb.Qdrant.SearchPoints, Qdrantex.Pb.Qdrant.SearchResponse

  rpc :SearchBatch, Qdrantex.Pb.Qdrant.SearchBatchPoints, Qdrantex.Pb.Qdrant.SearchBatchResponse

  rpc :Scroll, Qdrantex.Pb.Qdrant.ScrollPoints, Qdrantex.Pb.Qdrant.ScrollResponse

  rpc :Recommend, Qdrantex.Pb.Qdrant.RecommendPoints, Qdrantex.Pb.Qdrant.RecommendResponse

  rpc :RecommendBatch,
      Qdrantex.Pb.Qdrant.RecommendBatchPoints,
      Qdrantex.Pb.Qdrant.RecommendBatchResponse

  rpc :Count, Qdrantex.Pb.Qdrant.CountPoints, Qdrantex.Pb.Qdrant.CountResponse
end

defmodule Qdrantex.Pb.Qdrant.Points.Stub do
  @moduledoc false
  use GRPC.Stub, service: Qdrantex.Pb.Qdrant.Points.Service
end