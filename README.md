# Modelo-Conceitual-e-Logico-para-Ecommerce
Este projeto apresenta a modelagem e implementação de um banco de dados para um sistema de e-commerce. O esquema lógico é projetado para gerenciar informações de clientes, produtos, pedidos, fornecedores, pagamentos e vendedores. O banco de dados também permite rastrear o status de entregas e gerenciar múltiplas formas de pagamento por pedido. As queries fornecem insights sobre vendas, estoque e relações entre entidades, ajudando na tomada de decisões estratégicas.

Modelo Conceitual e Lógico
O banco de dados será modelado para refletir os requisitos do cenário:

1 - Entidades Principais:

- Cliente (PJ e PF diferenciados por tipo de conta)
- Pedido (associado a cliente, status, e rastreio de entrega)
- Produto (com estoque e fornecedores)
- Pagamento (associado a pedidos)
- Fornecedor
- Vendedor (possibilidade de ser também fornecedor)

2 - Relacionamentos:

- Um cliente pode realizar muitos pedidos.
- Um pedido pode conter múltiplos produtos.
- Um fornecedor pode fornecer muitos produtos.
- Um pedido pode ter múltiplos pagamentos.
- Um vendedor pode também ser fornecedor.

3 - Considerações de Modelagem:

- Diferenciar Cliente PJ e Cliente PF por meio de uma tabela com chave estrangeira e uma coluna discriminadora.
- Registrar múltiplas formas de pagamento por pedido.
- Rastrear status e código de entrega.

**Queries para Consultas**

**1. Recuperações simples com SELECT:**

SELECT * FROM Produto;

**2. Filtros com WHERE:**

SELECT * FROM Pedido WHERE Status = 'Pendente';

**3. Geração de Atributos Derivados:**

SELECT Nome, Preco * Estoque AS ValorTotalEstoque FROM Produto;

**4. Ordenação com ORDER BY:**

SELECT Nome, Preco FROM Produto ORDER BY Preco DESC;

**6. Condições de Filtros com HAVING:**

SELECT PedidoID, SUM(Quantidade) AS TotalItens
FROM PedidoProduto
GROUP BY PedidoID
HAVING TotalItens > 1;

**7. Junções entre Tabelas**

SELECT c.Nome AS Cliente, p.Nome AS Produto, pp.Quantidade
FROM PedidoProduto pp
JOIN Pedido pe ON pp.PedidoID = pe.PedidoID

JOIN Cliente c ON pe.ClienteID = c.ClienteID

JOIN Produto p ON pp.ProdutoID = p.ProdutoID;
