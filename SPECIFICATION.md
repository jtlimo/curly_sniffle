## Interface
A interface do servidor pode ser realizada através do padrão de API de escolha
do candidato (alguns exemplos são os padrões REST, GraphQL e gRPC), desde que se atenha aos
requisitos especificados aqui.

## Funcionalidades

### Cadastro de conta
Neste endpoint, devem ser enviados os dados de uma conta e ela deve ser cadastrada na base de contas, caso os dados de usuário estejam válidos de acordo com a seção Regras de negócio.

### Autenticação
Neste endpoint, devem ser enviados os dados de login de uma conta já cadastrada.
Esses dados devem ser validados e deve ser retornado um token que será utilizado
para validar transações do usuário. Nos próximos endpoints, o token deve ser
enviado para identificar o usuário logado.

### Cadastro de transação
Neste endpoint, devem ser enviados os dados de uma transação e ela deve ser
cadastrada na base de transações, caso ela seja feita entre contas válidas e
caso haja saldo suficiente na conta do usuário logado para realização dela.

### Estorno de transação
Neste endpoint, deve ser enviado o ID de uma transação já cadastrada e os efeitos dessa transação devem ser revertidos, caso seja possível e a transação tenha sido iniciada pelo usuário logado.

### Busca de transações por data
Neste endpoint, devem ser enviadas datas inicial e final.
O endpoint deve retornar todas as transações realizadas pelo usuário logado entre essas datas em ordem cronológica.

### Visualização de saldo
Neste endpoint, deve ser visualizado o saldo do usuário logado.

## Regras de negócio

- Não deve ser possível forjar um token de autenticação. Os tokens devem identificar de forma única o usuário logado.
- Uma transação só deve ser realizada caso haja saldo suficiente na conta do usuário para realizá-la.
- Após a realização de uma transação, a conta do usuário enviante deve ter seu valor descontado do valor da transação e a do usuário recebedor acrescentada do valor da transação.
- Todas as transações realizadas devem ser registradas no banco de dados.
- Caso todas as transações no banco de dados sejam realizadas novamente a partir do estado inicial de todas as contas, os saldos devem equivaler aos saldos expostos na interface. Em outros termos: Para toda conta, se somarmos os valores de todas as transações no histórico dela a qualquer momento, o saldo total da conta deve ser o saldo atual.
Uma transação só pode ser estornada uma vez.


## Entidades
As entidades descritas abaixo são especificações do mínimo de dados necessários para as operações do sistema. Podem ser adicionados outros campos conforme o candidato considere necessário.

### Conta de usuário
Uma conta de usuário precisa no mínimo dos seguintes dados para criação:

- Nome e sobrenome do portador
- CPF do portador
- Saldo inicial

Adicionalmente, a conta deve armazenar no mínimo os seguintes dados:

- Identificador único
- Data de criação


### Transação
Uma transação precisa no mínimo dos seguintes dados para criação:

- Identificador da conta enviante
- Identificador da conta recebedora
- Valor

Adicionalmente, o registro deve conter no mínimo os seguintes dados:

- Data de processamento
- Identificador único