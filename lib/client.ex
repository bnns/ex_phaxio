defmodule ExPhaxio.Client do
  @moduledoc """
  Module to interact with Phaxio and send faxes.

  ## Configuration

  Add your Phaxio secrets to your config:

      # config/config.exs
      config :ex_phaxio,
        phaxio_key: "#############",
        phaxio_secret: "##############"

  Alternately, if you want to use environment variables:

      # config/config.exs
      config :ex_phaxio,
        phaxio_key: {:system, "PHAXIO_KEY"},
        phaxio_secret: {:system, "PHAXIO_SECRET}

  Then invoke the `Client` macro in one of your modules.

      # lib/faxer.ex
      defmodule MyApp.UserFaxer do
        use ExPhaxio.Client
      end

  The `UserFaxer` module now has `send_fax/2` and other useful methods.

  ## Sending a Fax

  Invoke `send_fax/2` method with keyword list of `:to`, `:file`, `:content_url`, etc. For all params, see ExPhaxio.Requests.FaxRequest.

    # lib/user_faxer.ex
    defmodule MyApp.UserFaxer do
      use ExPhaxio.Client
    end

    $ iex -S mix
    iex> MyApp.UserFaxer.send_fax(to: "15554443333", file: "/path/to/fax.html")
  """

  alias ExPhaxio.Requests.FaxRequest

  defmacro __using__(_config) do
    quote do
      def send_fax(opts) do
        fax_request = FaxRequest.new_fax(opts)
        unquote(__MODULE__).send_fax(fax_request)
      end
    end
  end

  def send_fax(%FaxRequest{} = request) do
    with {:ok, response} <- ExPhaxio.create(request) do
      response
      |> Map.get(:body)
      |> Poison.decode
    end
  end
end
