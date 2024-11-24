-- Criação do Bacno de Dados para o cenário de E-commerce

CREATE DATABASE ECommerce;

USE ECommerce;

-- Tabela de Clientes
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Tipo ENUM('PF', 'PJ') NOT NULL,
    CPF_CNPJ VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela de Vendedores
CREATE TABLE Vendedor (
    VendedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedor (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela de Produtos
CREATE TABLE Produto (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(FornecedorID)
);

-- Tabela de Pedidos
CREATE TABLE Pedido (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    Status ENUM('Pendente', 'Enviado', 'Entregue', 'Cancelado') NOT NULL,
    CodigoRastreamento VARCHAR(255),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamento (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    FormaPagamento ENUM('Cartao', 'Boleto', 'Pix', 'Transferencia') NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);

-- Tabela de Produtos em Pedidos
CREATE TABLE PedidoProduto (
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY (PedidoID, ProdutoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Inserir Clientes
INSERT INTO Cliente (Nome, Tipo, CPF_CNPJ, Email) VALUES
('João Silva', 'PF', '12345678901', 'joao@email.com'),
('Empresa ABC', 'PJ', '98765432000109', 'contato@empresaabc.com');

-- Inserir Vendedores
INSERT INTO Vendedor (Nome, Email) VALUES
('Carlos Santos', 'carlos@vendedor.com');

-- Inserir Fornecedores
INSERT INTO Fornecedor (Nome, Email) VALUES
('Fornecedor A', 'fornecedora@empresa.com');

-- Inserir Produtos
INSERT INTO Produto (Nome, Preco, Estoque, FornecedorID) VALUES
('Notebook', 3500.00, 10, 1),
('Mouse', 50.00, 100, 1);

-- Inserir Pedidos
INSERT INTO Pedido (ClienteID, DataPedido, Status, CodigoRastreamento) VALUES
(1, '2024-11-01', 'Pendente', 'TRACK123'),
(2, '2024-11-02', 'Enviado', 'TRACK456');

-- Inserir Pagamentos
INSERT INTO Pagamento (PedidoID, FormaPagamento, Valor) VALUES
(1, 'Cartao', 3550.00),
(2, 'Pix', 50.00);

-- Associar Produtos aos Pedidos
INSERT INTO PedidoProduto (PedidoID, ProdutoID, Quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 2, 1);

