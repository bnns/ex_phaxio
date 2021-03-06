defmodule ExPhaxio.Resources.Recipient do
  @moduledoc """
  The Recipient module provides a struct representing fax recipients.
  """
  @enforce_keys ~w(phone_number status)a
  defstruct [phone_number: nil,
             status: nil,
             retry_count: nil,
             completed_at: nil,
             bitrate: nil,
             resolution: nil,
             error_type: nil,
             error_id: nil,
             error_message: nil]
end
