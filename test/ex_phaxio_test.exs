defmodule ExPhaxioTest do
  use ExUnit.Case
  doctest ExPhaxio
  @test_number "+15005550006"
  @test_file_path "test/test.html"

  test "faxers can use Client to automate configuration" do
    defmodule Faxer do
      use ExPhaxio.Client
    end

    assert :functions
    |> Faxer.__info__
    |> Enum.member?({:send_fax, 1})

    {:ok, response} = Faxer.send_fax(to: @test_number, file: @test_file_path)

    assert response != nil
  end

end
