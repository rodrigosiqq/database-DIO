-- Criação da tabela Cliente
CREATE TABLE Cliente (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Endereco VARCHAR(255) NOT NULL
);

-- Criação da tabela Produto
CREATE TABLE Produto (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Descricao VARCHAR(255) NOT NULL,
  Preco DECIMAL(10, 2) NOT NULL
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Data DATE NOT NULL,
  Cliente_ID INT,
  FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);



-- ecuperações simples com SELECT Statement:

-- Recuperar todos os clientes: 

SELECT * FROM Cliente;

-- Recuperar todos os produtos:

SELECT * FROM Produto;

-- Recuperar todos os pedidos:

SELECT * FROM Pedido;

-- Filtros com WHERE Statement:

-- Recuperar clientes com nome "joão":

SELECT * FROM Cliente WHERE Nome = 'João';

-- Recuperar produtos com preço acima de 100:

SELECT * FROM Produto WHERE Preco > 100;

-- Recuperar pedidos feitos após uma determinada data:

SELECT * FROM Pedido WHERE Data > '2023-01-01';

-- Criação de expressões para gerar atributos derivados:

-- Recuperar o nome completo (concatenando nome e sobrenome) dos clientes:

SELECT CONCAT(Nome, ' ', Sobrenome) AS NomeCompleto FROM Cliente;

-- Recuperar o preço total de cada pedido (somando o preço de todos os produtos do pedido):

SELECT Pedido.ID, SUM(Produto.Preco) AS PrecoTotal
FROM Pedido
JOIN DetalhesPedido ON Pedido.ID = DetalhesPedido.Pedido_ID
JOIN Produto ON DetalhesPedido.Produto_ID = Produto.ID
GROUP BY Pedido.ID;

-- Definição de ordenações dos dados com ORDER BY:

SELECT * FROM Produto ORDER BY Nome;

Recuperar todos os pedidos ordenados por data em ordem decrescente:

SELECT * FROM Pedido ORDER BY Data DESC;

-- Recuperar pedidos com um valor total acima de 500:

SELECT Pedido.ID, SUM(Produto.Preco) AS PrecoTotal
FROM Pedido
JOIN DetalhesPedido ON Pedido.ID = DetalhesPedido.Pedido_ID
JOIN Produto ON DetalhesPedido.Produto_ID = Produto.ID
GROUP BY Pedido.ID
HAVING PrecoTotal > 500;

-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados: 

-- Recuperar todos os pedidos com os detalhes do cliente:

SELECT Pedido.ID, Cliente.Nome, Cliente.Email
FROM Pedido
JOIN Cliente ON Pedido.Cliente_ID = Cliente.ID;

-- Recuperar todos os produtos de um pedido específico:

SELECT Pedido.ID, Produto.Nome, Produto.Preco
FROM Pedido
JOIN DetalhesPedido ON Pedido.ID = DetalhesPedido.Pedido_ID
JOIN Produto ON DetalhesPedido.Produto_ID = Produto.ID
WHERE Pedido.ID = 1;


