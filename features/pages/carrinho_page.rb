class Carrinho < SitePrism::Page
    set_url ''

    #Elementos
    element :botao_vida_protegida, 'div[class="detalhes-seguro"]'
    element :botao_protecao_casa_mais, 'label[class="item-seguro"]'
    def botao_excluir(codigo)
        find("button[class='is-removable excluir-produto qa-cart-remove-product-click #{codigo}']")
    end
    def botao_editar(codigo)
        find("button[class='qa-cart-edit-item-click #{codigo}']")
    end
    def botao_retirar_nesta_loja(codigo)
        find("option[class='qa-cart-pickup-option-click #{codigo} qa-cart-altern-pickup-option-click']")
    end
    element :botao_confirmar_endereco, '#qa-cart-cd-data-confirm-click'
    element :botao_cancelar_endereco, '#qa-cart-cd-data-cancel-click'
    element :botao_carne, 'button[class="header-title qa-core-filters-click carne"]'
    element :campo_valor_entrada, '#valor-forma-carne'
    element :botao_ok_entrada, 'button[class="qa-cart-carne-input-value-confirm-clean-click"]'
    def dia_primeiro_vencimento(vencimento)
        find("label[class='qa-cart-cdc-#{vencimento}-days-label']")
    end
    element :botao_selecionar_parcelas, '#select-parcelas-carne'
    def quantidade_parcelas(parcelas)
        find("option[class='qa-cart-carne-select-payment-conditions-select-click #{parcelas}']")
    end
    element :botao_confirmar, 'button[class="qa-cart-carne-select-payment-conditions-confirm"]'
    element :botao_cancelar, 'button[class="is-secondary qa-cart-carne-select-payment-conditions-cancel"]'
    element :botao_cartao_cb, 'button[class="header-title qa-core-filters-click cartao-casas-bahia"]'
    element :botao_cartao_credito, 'button[class="header-title qa-core-filters-click cartao-de-credito"]'
    element :botao_dinheiro, 'button[class="header-title qa-core-filters-click dinheiro"]'
    element :botao_cartao_debito, 'button[class="header-title qa-core-filters-click cartao-de-debito"]'
    element :botao_outros_pagamentos, 'button[class="header-title qa-core-filters-click outras-formas-de-pagamento is-multiple"]'
    element :botao_banqi, 'button[class="header-title qa-core-filters-click banqi is-multiple"]'
    element :botao_pix, 'button[class="header-title qa-core-filters-click pix is-multiple"]'
    element :botao_deposito_identificado, 'button[class="header-title qa-core-filters-click deposito-identificado is-multiple"]'
    element :botao_cheque, 'button[class="header-title qa-core-filters-click cheque is-multiple"]'
    element :botao_credito_super_troca, 'button[class="header-title qa-core-filters-click credito-super-troca is-multiple"]'
    element :botao_credito_fique_seguro, 'button[class="header-title qa-core-filters-click credito-fique-seguro is-multiple"]'
    element :botao_banricompras, 'button[class="header-title qa-core-filters-click banricompras is-multiple"]'
    element :botao_cupom_desconto, 'button[class="header-title qa-core-filters-click cupom-de-desconto"]'
    element :botao_codigo_promocional, 'button[class="header-title qa-core-filters-click codigo-promocional"]'
    element :botao_desconto, 'button[class="header-title qa-core-filters-click desconto"]'
    element :botao_ver_detalhes, 'button[class="toggle-total-per-type"]'
    element :botao_gerar_pedido, 'button[class="main-action qa-cart-payment-footer-delivery-cart-submit-payment-click"]'


    #Métodos
    def concluir_pedido(codigo, pagamento, entrada, vencimento, parcelas)
        selecionar_endereco(codigo)
        forma_pagamento(pagamento, entrada, vencimento, parcelas)
        botao_gerar_pedido.click
    end

    def selecionar_endereco(codigo)
        botao_editar(codigo).click
        botao_retirar_nesta_loja(codigo).click
        botao_confirmar_endereco.click
    end

    def forma_pagamento(pagamento, entrada, vencimento, parcelas)
        botao_carne.click
        sleep(1)
        campo_valor_entrada.set(entrada)
        botao_ok_entrada.click
        dia_primeiro_vencimento(vencimento).click
        quantidade_parcelas(parcelas).click
        botao_confirmar.click
    end
end