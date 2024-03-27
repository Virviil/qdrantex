defmodule Qdrantex do
  @moduledoc """
  Use this module to build your own Repo module.

  Example:

      defmodule MyApp.Repo do
        use Qdrantex, otp_app: :my_app
      end

  Check `Qdrantex.Repo` for the default implementation and docs on how your Repo would be generated.
  """

  defmacro __using__(opts) do
    # Running checks in compile time
    case Keyword.fetch(opts, :otp_app) do
      {:ok, _} -> :ok
      _ -> raise ":otp_app must be configured"
    end

    quote location: :keep do
      @name unquote(__CALLER__.module)


      @doc """
      Starts Repo under supervision tree. It accepts options as a keyword list.
      Options will be combined with hardcoded options from `use` statement,
      and with the configuration from the application.

      Options:

      * `:hostname` - the hostname of the Qdrant service. Default is `"localhost"`.
      * `:port` - the port of the Qdrant service. Default is `6333`.
      * `:otp_app` - the name of the OTP application. Required, but commonly set in `use` statement.
      * `:api_key` - the API key for the Qdrantex service. Can be `nil` if Qdrant service does not require it.
      * `:ssl` - the SSL options for the connection. Can be `nil` if Qdrant service does not require it.

      * All options from `DBConnection.start_link/2`. All these are optional.

      """
      @spec start_link(Keyword.t) :: GenServer.on_start()
      def start_link(opts) do
        DBConnection.start_link(
          Qdrantex.Protocol,
          opts =
            [
              # Default opts
              pool_size: 10
            ]
            # Opts from `using`
            |> Keyword.merge(unquote(opts))
            # Adding data from config
            |> Keyword.merge(Application.get_all_env(unquote(opts[:otp_app])))
            # Merging start_link opts
            |> Keyword.merge(opts)
            # Merging name
            |> Keyword.merge(name: @name)
        )
      end

      @doc """
      Executes a query. It accepts module, rpc name as atom and struct %...Request{} as data.

      Example:

          Qdrantex.Repo.execute(Qdrantex.Qdrant.Qdrant.Stub, :health_check, %Qdrantex.Qdrant.HealthCheckRequest{})
      """
      @spec execute(atom, atom, map) :: {:ok, map} | {:error, any}
      def execute(module, rpc, data) do
        case DBConnection.execute(
               @name,
               %Qdrantex.Query{module: module, rpc: rpc, data: data},
               []
             ) do
          {:ok, query, response} -> {:ok, response}
          {:error, reason} -> {:error, reason}
        end
      end

      @doc """
      Executes a query. It accepts a closure that accepts GRPC.Channel.t() as an argument.
      This channel will be substituted with the actual channel during the execution,
      channel will be provided by the Repo itself.

      You can generate this closure with simplified syntax from *.Stub gRPC nodules:

      Example:

            Qdrantex.Repo.run(&Qdrantex.Qdrant.Stub.health_check(&1, %Qdrantex.Qdrant.HealthCheckRequest{}))
      """
      @spec run(closure :: (GRPC.Channel.t() -> any)) :: {:ok, map} | {:error, any}
      def run(closure) do
        case DBConnection.execute(@name, %Qdrantex.ClosureQuery{closure: closure}, []) do
          {:ok, query, response} -> {:ok, response}
          {:error, reason} -> {:error, reason}
        end
      end
    end
  end
end
