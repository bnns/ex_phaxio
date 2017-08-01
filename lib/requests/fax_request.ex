defmodule ExPhaxio.Requests.FaxRequest do
  @moduledoc """
  The FaxRequest module provides the primary struct to make fax requests, as
  well as helper methods.

  For example, `to_form_body/1` transforms a %FaxRequest{} into a multipart form body. This is especially useful for sending files to be used as the fax body.
  """
  @derive {Poison.Encoder, []}
  defstruct [to: nil,
             file: nil,
             content_url: nil,
             header_text: nil,
             batch_delay: 60,
             batch_collision_avoidance: true,
             callback_url: nil,
             cancel_timeout: nil,
             tags: nil,
             caller_id: nil,
             test_fail: nil]

  def new_fax(attrs \\ []) do
    struct!(%__MODULE__{}, attrs)
  end

  def to_keywords(%__MODULE__{} = request) do
    request
    |> Map.to_list
    |> Keyword.delete(:__struct__)
    |> Enum.filter(fn {_, v} -> v != nil end)
  end

  def to_params(%__MODULE__{} = request) do
    request
    |> to_keywords
  end

  def to_form_body(%__MODULE__{} = request) do
    request
    |> to_keywords
    |> form_body_list
  end

  defp form_body_list(list) do
    body = Enum.map(list, &atom_key_to_string/1)

    {:multipart, body}
  end

  defp atom_key_to_string({:file, v}), do: {:file, v}
  defp atom_key_to_string({k, v}) do
    {Atom.to_string(k), to_string(v)}
  end

end
