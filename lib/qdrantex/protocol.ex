defmodule Qdrantex.Error do
  defexception [:message]
end

defmodule Qdrantex.Protocol do
  use DBConnection

  defstruct [:chan]

  @impl true
  def checkout(state) do
    {:ok, state}
  end

  ###################################################################
  # Connecting and disconnecting
  ###################################################################
  @impl true
  def connect(opts) do
    IO.inspect(opts)
    hostname = Keyword.get(opts, :hostname, "localhost")
    port = Keyword.get(opts, :port, 6334)

    case GRPC.Stub.connect(hostname, port, accepted_compressors: [GRPC.Compressor.Gzip]) do
      {:ok, chan} ->
        {:ok, %__MODULE__{chan: chan}}

      {:error, reason} ->
        {:error, %Qdrantex.Error{message: "error when connecting #{inspect(reason)}"}}
    end
  end

  @impl true
  @spec ping(%{:chan => GRPC.Channel.t(), optional(any) => any}) ::
          {:ok, %{:chan => GRPC.Channel.t(), optional(any) => any}}
          | {:disconnect, %Qdrantex.Error{__exception__: true, message: <<_::64, _::_*8>>},
             %{:chan => GRPC.Channel.t(), optional(any) => any}}
  def ping(%{chan: chan} = state) do
    case Qdrantex.Pb.Qdrant.Qdrant.Stub.health_check(
           chan,
           Qdrantex.Pb.Qdrant.HealthCheckRequest.new()
         ) do
      {:ok, _} ->
        {:ok, state}

      {_, reason} ->
        {:disconnect, %Qdrantex.Error{message: "ping failed with reason: #{inspect(reason)}"},
         state}
    end
  end

  @impl true
  def disconnect(_error, %{chan: chan} = _state) do
    GRPC.Stub.disconnect(chan)
    :ok
  end

  ###################################################################
  # / Connecting and disconnecting
  ###################################################################

  @impl true
  def handle_prepare(query, _opts, state) do
    {:ok, query, state}
  end

  @impl true
  def handle_execute(
        %{module: module, rpc: rpc, data: data} = query,
        _params,
        _opts,
        %{chan: chan} = state
      ) do
    case Kernel.apply(module, rpc, [chan, data]) do
      {:ok, response} ->
        {:ok, query, response, state}

      {:error, reason} ->
        {:disconnect, %Qdrantex.Error{message: "error when executing query: #{inspect(reason)}"},
         state}
    end
  end
end
