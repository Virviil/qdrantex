defmodule Qdrantex.Repo do
  @moduledoc """
  Default implementation for Qdrantex.Repo

  You can use it in your application, simply add it to the supervision tree.

  Configuration:

      config :qdrantex, Qdrantex.Repo,
        api_key: "your_secret_api_key_here"



  """
  use Qdrantex, otp_app: :qdrantex
end
