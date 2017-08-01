defmodule ExPhaxio.Config do
  @moduledoc """
  Config provides setup methods for interacting with the API.
  """
  defstruct [api_key: nil,
             api_secret: nil]

  def host, do: "https://api.phaxio.com/"

  def request_opts, do: []

  def key, do: get(:ex_phaxio, :phaxio_key)

  def secret, do: get(:ex_phaxio, :phaxio_secret)

  def version, do: get(:ex_phaxio, :phaxio_version) || "v2"

  def headers, do: [{"accept", "application/json; charset=utf-8"}]

  def headers(opts) when is_list(opts), do: assign_headers([], opts)
  def headers(:with_auth) do
    encoded = Base.encode64("#{key()}:#{secret()}")
    [{"authorization", "Basic #{encoded}"}]
  end
  def headers(:form), do: [{"content-type", "application/x-www-form-urlencoded"}]
  def headers(_), do: raise ArgumentError, message: "headers/1 expects a keyword list or atom"

  def assign_headers(my_headers, []), do: my_headers
  def assign_headers(my_headers, [opt|tail]) do
    assign_headers my_headers ++ headers(opt), tail
  end

  def get(app, key, default \\ nil) when is_atom(app) and is_atom(key) do
    app
    |> Application.get_env(key)
    |> process_env(default)
  end

  defp process_env(nil, default), do: default
  defp process_env({:system, env_var, fallback}, _default) do
    case System.get_env(env_var) do
      nil -> fallback
      val -> val
    end
  end
  defp process_env({:system, env_var}, default) do
    case System.get_env(env_var) do
      nil -> default
      val -> val
    end
  end
  defp process_env(val, _default), do: val

end
