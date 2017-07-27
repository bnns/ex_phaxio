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
end
