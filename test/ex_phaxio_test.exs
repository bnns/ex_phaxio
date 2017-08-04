defmodule ExPhaxioTest do
  use ExUnit.Case
  doctest ExPhaxio
  @test_number "+15005550006"
  @test_file_path "test/test.html"

  defmacro assert_functions(module, funcs \\ []) do
    quote do
      assert unquote(funcs)
      |> Enum.all?(&Enum.member?(unquote(module).__info__(:functions), &1))
    end
  end

  test "faxers can use Client to automate configuration" do
    defmodule Faxer do
      use ExPhaxio.Client
    end

    assert_functions Faxer, [
      create_fax: 1,
      cancel_fax: 1,
      show_fax: 1,
      list_faxes: 1,
      resend_fax: 1
    ]

    {_, response} = Faxer.create_fax(to: @test_number, file: @test_file_path)

    assert response != nil
  end

end
