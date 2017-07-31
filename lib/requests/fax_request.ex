defmodule ExPhaxio.Requests.FaxRequest do
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

  def form_body(%__MODULE__{} = request) do
    request
    |> Map.to_list
    |> form_body_list
  end

  defp form_body_list(list), do: {:form, list}
end
