defmodule ExPhaxioTest do
  use ExUnit.Case
  doctest ExPhaxio

  test "faxers can use Client to automate configuration" do
    defmodule Faxer do
      use ExPhaxio.Client
    end

    assert Faxer.__info__(:functions) |> Enum.member?({:send_fax, 1})
  end

end
