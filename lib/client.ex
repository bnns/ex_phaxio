defmodule ExPhaxio.Client do
  @moduledoc """
  Module to interact with the Phaxio API.

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

  The `UserFaxer` module now has `create_fax/2` and other useful methods.

  ## Sending a Fax

  Invoke `create_fax/2` method with keyword list of `:to`, `:file`, `:content_url`, etc. For all params, see ExPhaxio.Requests.FaxRequest.

    # lib/user_faxer.ex
    defmodule MyApp.UserFaxer do
      use ExPhaxio.Client
    end

    $ iex -S mix
    iex> MyApp.UserFaxer.create_fax(to: "+15554443333", file: "/path/to/fax.html")
  """

  require Logger
  alias ExPhaxio.Requests.FaxRequest
  alias HTTPoison.Response

  defmacro __using__(_config) do
    quote do
      def create_fax(opts) do
        fax_request = FaxRequest.new_fax(opts)
        unquote(__MODULE__).create_fax(fax_request)
      end

      def cancel_fax(opts) do
        unquote(__MODULE__).cancel_fax(opts)
      end

      def show_fax(opts) do
        unquote(__MODULE__).show_fax(opts)
      end

      def list_faxes(opts) do
        unquote(__MODULE__).list_faxes(opts)
      end

      def resend_fax(opts) do
        unquote(__MODULE__).resend_fax(opts)
      end
    end
  end

  def cancel_fax(id: id), do: ExPhaxio.cancel(id)

  def resend_fax(id: id, url: url), do: ExPhaxio.resend(id, url)

  def list_faxes(opts), do: ExPhaxio.list(opts)

  def show_fax(id: id), do: ExPhaxio.show(id)

  def create_fax(%FaxRequest{} = request) do
    Logger.info """
    Sending fax with ExPhaxio:

    #{inspect request, limit: :infinity}
    """
    with {:ok, response} <- ExPhaxio.create(request),
         {:ok, %{"success" => true} = body} <- parse_body(response) do
      {:ok, body}
    else
      {:ok, %{"message" => message} = _body} ->
        {:error, "#{message}"}
      err ->
        {:error, "#{inspect err}"}
    end
  end

  defp parse_body(%Response{} = r), do: r |> Map.get(:body) |> Poison.decode
end
