defmodule TransactionTest do
  @moduledoc false
  use ExUnit.Case
  doctest Transaction

  test "creates an transaction" do
    params = %{accountSender: "uuidqualquer", accountReceiver: "uuidoutroalemdesse", value: 100}
    transaction = Transaction.create(params)

    assert transaction.accountSender == "uuidqualquer"
    assert transaction.accountReceiver == "uuidoutroalemdesse"
    assert transaction.value == 100
  end

  test "only creates an transaction between two accounts when accountSender has sufficient balance" do
    account_sender_params = %{name: "Jess", lastName: "Lima", cpf: "231421421", balance: 0}
    account_receiver_params = %{name: "Bia", lastName: "Fileto", cpf: "23142142133", balance: 0}
    params = %{accountSender: "uuidqualquer", accountReceiver: "uuidoutroalemdesse", value: 100}

    Kernel.inspect(account_sender_params)
    Kernel.inspect(account_receiver_params)

    account_sender = Account.create(account_sender_params)
    account_receiver = Account.create(account_receiver_params)

    {:error, reason} = Transaction.create(params)

    assert :error
    # assert transaction.accountReceiver == "uuidoutroalemdesse"
    # assert transaction.value == 100
  end
end
