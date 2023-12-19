defmodule Account do
  @moduledoc """
    Module to create an account
  """
  defstruct [:name, :lastName, :cpf, balance: 0]

  def create(params) do
    {:ok,
     %Account{
       name: params.name,
       lastName: params.lastName,
       cpf: params.cpf,
       balance: params.balance
     }}
  end
end
