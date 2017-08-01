defmodule ExPhaxio.Config do
  defstruct [api_key: nil,
             api_secret: nil]

  def host, do: "https://api.phaxio.com/"

  def request_opts, do: []

  def key, do: get(:ex_phaxio, :phaxio_key)

  def secret, do: get(:ex_phaxio, :phaxio_secret)

  def version, do: get(:ex_phaxio, :phaxio_version) || "v2"

  def headers(), do: [{"accept", "application/json; charset=utf-8"}]

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

  # from https://gist.github.com/bitwalker/a4f73b33aea43951fe19b242d06da7b9
  def get(app, key, default \\ nil) when is_atom(app) and is_atom(key) do
    case Application.get_env(app, key) do
      {:system, env_var} ->
        case System.get_env(env_var) do
          nil -> default
          val -> val
        end
      {:system, env_var, preconfigured_default} ->
        case System.get_env(env_var) do
          nil -> preconfigured_default
          val -> val
        end
      nil ->
        default
      val ->
        val
    end
  end

end
