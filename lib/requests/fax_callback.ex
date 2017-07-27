defmodule ExPhaxio.Requests.FaxCallback do
  defstruct [success: nil,
             is_test: nil,
             direction: nil,
             fax: nil,
             message: nil]
end
