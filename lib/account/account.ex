defmodule Account do
  defstruct [:name, :lastName, :cpf, balance: 0]

  def create(params) do
    %Account{
      name: params.name,
      lastName: params.lastName,
      cpf: params.cpf,
      balance: params.balance
    }
  end
end
