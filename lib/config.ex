defmodule ExPhaxio.Config do
  def host, do: "https://api.phaxio.com/"

  def request_opts, do: [params: auth()]

  def auth, do: [{:api_key, key()}, {:api_secret, secret()}]

  def key, do: Application.get_env(:ex_phaxio, :phaxio_key)

  def secret, do: Application.get_env(:ex_phaxio, :phaxio_secret)

  def version, do: Application.get_env(:ex_phaxio, :phaxio_version) || "v2"

  def headers do
    ["accept": "application/json; charset=utf-8"]
  end
end
