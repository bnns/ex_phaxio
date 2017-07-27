defmodule ExPhaxio.Resources.Fax do
  @enforce_keys ~w(id to_number from_number)a
  defstruct [id: nil,
             direction: nil,
             num_pages: nil,
             cost: nil,
             status: nil,
             is_test: nil,
             created_at: nil,
             caller_id: nil,
             from_number: nil,
             to_number: nil,
             recipients: nil,
             tags: nil,
             error_type: nil,
             error_message: nil,
             error_id: nil,
             completed_at: nil]
end
