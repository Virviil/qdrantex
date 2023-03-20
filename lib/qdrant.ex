defmodule Qdrant do
  defmacro __using__(opts) do
    # Running checks in compile time
    case Keyword.fetch(opts, :otp_app) do
      {:ok, _} -> :ok
      _ -> raise ":otp_app must be configured"
    end

    quote location: :keep do
      @name unquote(__CALLER__.module)

      def start_link(opts) do
        DBConnection.start_link(
          Qdrant.Protocol,
          opts =
            [
              # Default opts
              pool_size: 10
            ]
            # Adding data from config
            |> Keyword.merge(Application.get_all_env(unquote(opts[:otp_app])))
            # Merging start_link opts
            |> Keyword.merge(opts)
            # Merging name
            |> Keyword.merge(name: @name)
        )
      end

      def execute(module, rpc, data) do
        DBConnection.execute(@name, %Qdrant.Query{module: module, rpc: rpc, data: data}, [])
      end

      def prepare(module, rpc, data) do
        DBConnection.prepare(@name, %Qdrant.Query{module: module, rpc: rpc, data: data}, [])
      end
    end
  end
end

defmodule Qdrant.Repo do
  use Qdrant,
    otp_app: :qdrant
end
