defmodule AccountTest do
  @moduledoc false
  use ExUnit.Case
  doctest Account

  test "creates an account" do
    params = %{name: "jess", lastName: "Lima", cpf: "33108511840", balance: 100}
    account = Account.create(params)

    assert account.name == "jess"
    assert account.lastName == "Lima"
    assert account.cpf == "33108511840"
    assert account.balance == 100
  end
end
