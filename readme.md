entrega de projeto:

Modelagem Lógica do Banco de Dados para um Cenário de E-commerce:

Entidades:

Cliente (Customer):
ID (chave primária)
Nome
Email
Endereço
Produto (Product):
ID (chave primária)
Nome
Descrição
Preço
Pedido (Order):
ID (chave primária)
Data
Cliente_ID (chave estrangeira referenciando a tabela Cliente)
Relacionamentos:

Um cliente pode fazer vários pedidos.
Um pedido está associado a apenas um cliente.
Um pedido pode conter vários produtos.
Um produto pode estar presente em vários pedidos.
Constraints:

A chave primária de cada tabela será definida como um campo "ID" com autoincremento.
O campo "Cliente_ID" na tabela "Pedido" será uma chave estrangeira referenciando o campo "ID" na tabela "Cliente".
