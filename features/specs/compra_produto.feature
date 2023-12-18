#language: pt

@compraproduto
Funcionalidade: Compra de produtos

Contexto:
Dado que eu esteja no site CB

@teste
Cenário: realizar a compra de um produto P1 CDC
Quando selecionar o produto P1 desejado e finalizar a compra com CDC
Então a compra será concluída com a forma de pagamento CDC produto P1

Cenário: realizar a compra de um produto P3 CDC
Quando selecionar o produto P3 desejado e finalizar a compra com CDC
Então a compra será concluída com a forma de pagamento CDC produto P3