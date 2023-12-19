defmodule Transaction do
  @moduledoc """
    Module to create and validate a transaction between two accounts
  """
  defstruct [:accountSender, :accountReceiver, :value]

  def create(params) do
    {:ok,
     %Transaction{
       accountSender: params.accountSender,
       accountReceiver: params.accountReceiver,
       value: params.value
     }}
  end
end
