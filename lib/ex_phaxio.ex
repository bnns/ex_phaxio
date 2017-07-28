defmodule ExPhaxio do
  @moduledoc """
  ExPhaxio is a simple wrapper around the [Phaxio
  API](https://www.phaxio.com/docs/api/), which allows the sending and
  management of faxes.
  """
  import ExPhaxio.Config
  import ExPhaxio.Api
  alias ExPhaxio.Requests.FaxRequest

  @doc """
  Show info for a previously created fax.

  ## Examples

      iex> result = ExPhaxio.show("invalid_id")
      ...> with {:ok, %HTTPoison.Response{}} <- result, do: :passed
      :passed
  """
  def show(id) do
    url = host() <> version() <> show_path(id)
    HTTPoison.get(url, headers(:with_basic_auth), request_opts())
  end

  @doc """
  Show the attached content of a fax.

  Fax must be created with a `content_url`.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.show_content("id"), do: :passed
      :passed
  """
  def show_content(id, size \\ nil) do
    url = host() <> version() <> show_content_path(id, size)
    HTTPoison.get(url, headers(:with_basic_auth), request_opts())
  end

  @doc """
  List all faxes.

  It also accepts filtering parameters. For more, see
  [docs](https://www.phaxio.com/docs/api/v2/faxes/list_faxes).

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.list(), do: :passed
      :passed
  """
  def list(opts \\ []) do
    url = host() <> version() <> faxes_path()
    HTTPoison.get(url, headers(:with_basic_auth), request_opts() ++ opts)
  end

  @doc """
  List all countries that Phaxio supports.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.list_countries(), do: :passed
      :passed
  """
  def list_countries(opts \\ []) do
    url = host() <> version() <> countries_path()
    HTTPoison.get(url, headers(), opts)
  end


  @doc """
  Provision a phone number.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.provision_phone("1", "469"), do: :passed
      :passed
  """
  def provision_phone(country, area, cb_url \\ nil) do
    url = host() <> version() <> provision_path(country, area, cb_url)
    HTTPoison.post(url, "", headers(:with_basic_auth), request_opts())
  end

  @doc """
  Create and send a fax.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.create(%ExPhaxio.Requests.FaxRequest{}), do: :passed
      :passed

      iex> ExPhaxio.create(%{})
      {:error, "Parameter must be a FaxRequest."}

  """
  def create(%FaxRequest{} = request) do
    url = host() <> version() <> faxes_path()
    body = Poison.encode! request
    HTTPoison.post(url, body, headers(:with_basic_auth), request_opts())
  end
  def create(_), do: {:error, "Parameter must be a FaxRequest."}

  @doc """
  Resend a fax.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.resend("id", "https://my.domain.com/callback"), do: :passed
      :passed
  """
  def resend(id, cb_url \\ nil) do
    url = host() <> version() <> resend_path(id, cb_url)
    HTTPoison.post(url, "", headers(:with_basic_auth), request_opts())
  end

  @doc """
  Cancel a fax.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.cancel("id"), do: :passed
      :passed
  """
  def cancel(id) do
    url = host() <> version() <> cancel_path(id)
    HTTPoison.post(url, "", headers(:with_basic_auth), request_opts())
  end

  @doc """
  Get your account status.

  ## Examples

      iex> with {:ok, %HTTPoison.Response{}} <- ExPhaxio.account_status(), do: :passed
      :passed
  """
  def account_status() do
    url = host() <> version() <> account_status_path()
    HTTPoison.get(url, headers(:with_basic_auth), request_opts())
  end
end
