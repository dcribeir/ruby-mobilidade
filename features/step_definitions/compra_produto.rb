Dado('que eu esteja no site CB') do

end


##realizar a compra de um produto P1 CDC
Quando('selecionar o produto P1 desejado e finalizar a compra com CDC') do
  # operador = 'Compra_P1'
  # compra_produto.compra(operador)
end

Então('a compra será concluída com a forma de pagamento CDC produto P1') do
  # compra_produto.validacao_ok
end


#realizar a compra de um produto P3 CDC
Quando('selecionar o produto P3 desejado e finalizar a compra com CDC') do
  operador = 'Compra_P3'
  compra_produto.compra(operador)
end

Então('a compra será concluída com a forma de pagamento CDC produto P3') do
  compra_produto.validacao_ok
end