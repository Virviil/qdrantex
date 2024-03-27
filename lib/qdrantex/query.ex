defmodule Qdrantex.Query do
  @moduledoc false
  defstruct [:module, :rpc, :data]

  defimpl DBConnection.Query do
    def parse(query, _opts), do: query

    def describe(query, _opts), do: query

    def encode(_query, params, _opts), do: params

    def decode(_query, result, _opts), do: result
  end
end

defmodule Qdrantex.ClosureQuery do
  @moduledoc false
  defstruct [:closure]

  defimpl DBConnection.Query do
    def parse(query, _opts), do: query

    def describe(query, _opts), do: query

    def encode(_query, params, _opts), do: params

    def decode(_query, result, _opts), do: result
  end
end
