defmodule ExPhaxio.Resources.PhoneNumber do
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
