defmodule ExPhaxio.Resources.PhoneNumber do
  @moduledoc """
  The PhoneNumber module provides a struct representing phone numbers, which can
  be requested from Phaxio's provisioning endpoint.
  """
  @enforce_keys ~w(phone_number)a
  defstruct [phone_number: nil,
             city: nil,
             state: nil,
             country: nil,
             cost: nil,
             last_billed_at: nil,
             provisioned_at: nil,
             callback_url: nil]
end
