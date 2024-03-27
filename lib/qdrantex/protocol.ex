defmodule Qdrantex.Error do
  @moduledoc """
  Error struct for Qdrantex
  """
  defexception [:message]
end

defmodule Qdrantex.Protocol do
  @moduledoc false
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
    hostname = Keyword.get(opts, :hostname, "localhost")
    port = Keyword.get(opts, :port, 6334)
    api_key = Keyword.get(opts, :api_key, nil)
    ssl = Keyword.get(opts, :ssl, nil)

    headers =
      case api_key do
        nil -> []
        value when is_binary(value) -> [{"api-key", value}]
      end

    cred =
      case ssl do
        nil -> nil
        config -> GRPC.Credential.new(ssl: config)
      end

    case GRPC.Stub.connect(hostname, port,
           accepted_compressors: [GRPC.Compressor.Gzip],
           cred: cred,
           headers: headers
         ) do
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
    case Qdrantex.Qdrant.Qdrant.Stub.health_check(
           chan,
           %Qdrantex.Qdrant.HealthCheckRequest{}
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
        %Qdrantex.Query{module: module, rpc: rpc, data: data} = query,
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

  def handle_execute(
        %Qdrantex.ClosureQuery{closure: closure} = query,
        _params,
        _opts,
        %{chan: chan} = state
      ) do
    case closure.(chan) do
      {:ok, response} ->
        {:ok, query, response, state}

      {:error, reason} ->
        {:disconnect, %Qdrantex.Error{message: "error when executing query: #{inspect(reason)}"},
         state}
    end
  end

  ###################################################################
  # / Unused stubs
  ###################################################################
  @impl true
  def handle_begin(opts, state) do
    {:ok, opts, state}
  end

  @impl true
  def handle_close(query, opts, state) do
    {:ok, {query, opts}, state}
  end

  @impl true
  def handle_commit(opts, state) do
    {:ok, opts, state}
  end

  @impl true
  def handle_deallocate(query, cursor, opts, state) do
    {:ok, {query, cursor, opts}, state}
  end

  @impl true
  def handle_declare(query, params, opts, state) do
    {:ok, query, {params, opts}, state}
  end

  @impl true
  def handle_fetch(query, cursor, opts, state) do
    {:halt, {query, cursor, opts}, state}
  end

  @impl true
  def handle_rollback(opts, state) do
    {:ok, opts, state}
  end

  @impl true
  def handle_status(_opts, state) do
    {:idle, state}
  end
end
