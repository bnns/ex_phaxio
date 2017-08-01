defmodule ExPhaxio.Requests.FaxCallback do
  @moduledoc """
  The FaxCallback module provides a struct representing a callback.

  Useful for testing and setting up webhooks.
  """
  defstruct [success: nil,
             is_test: nil,
             direction: nil,
             fax: nil,
             message: nil]
end
