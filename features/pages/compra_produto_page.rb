include RSpec::Matchers

class CompraProduto < SitePrism::Page 

    def initialize
        @identificar_cliente = IdentificarCliente.new
        @selecionar_produto = SelecionarProduto.new
        @carrinho = Carrinho.new
        @api_crediario_proposta = APICrediarioProposta.new
    end
    
    set_url '/pesquisa'

    #Formulário
    element :campo_forma_pagamento, 'strong[class="qa-basket-cdc-payment-type-label-read"]'
    element :campo_valor_entrada, 'td[class="cell-nowrap qa-basket-cdc-initial-payment-value-label-read"]'
    element :campo_parcelas, 'td[class="qa-basket-cdc-conditions-label-read"]'
    element :capturar_proposta, 'span[class="proposal-number qa-basket-cdc-proposal-number-label-read"]'
    def campo_numero_proposta
        page.has_css?('span[class="proposal-number qa-basket-cdc-proposal-number-label-read"]')
    end

    #element :mensagem_sucesso, 'div[class="nf-form-wrap ninja-forms-form-wrap"]', :text => 'Your form has been successfully submitted.'

    #Métodos
    def carregar_variaveis(operador)
        if operador == 'Compra_P1'
            @cpf_cnpj = '06167409641'
            @produto = '311219'
            @garantia = nil
            @vencimento = '30'
            @parcelas = '5'
            @pagamento = 'Carnê'
            @entrada = '0,00'
        elsif operador == 'Compra_P3'
            @cpf_cnpj = '88363309915'
            @produto = '6764509'
            @garantia = '12'
            @vencimento = '30'
            @parcelas = '1'
            @pagamento = 'Carnê'
            @entrada = '20,00'
        elsif operador == 'Consultar'
            @cpf_cnpj = '88363309915'
            @produto = '6764509'
            @garantia = nil
            @vencimento = '60'
            @parcelas = '1'
            @pagamento = 'Carne'
            @entrada = '0,00'
        end
    end

    def compra(operador)
        carregar_variaveis(operador)

        @identificar_cliente.selecionar_cliente(@cpf_cnpj)
        @selecionar_produto.pesquisar_produto(@produto, @garantia)
        @carrinho.concluir_pedido(@produto, @pagamento, @entrada, @vencimento, @parcelas)
    end

    def validacao_ok
        expect(campo_forma_pagamento[:innerText]).to eq(@pagamento)
        expect(campo_valor_entrada[:innerText]).to eq("R$ #{@entrada}")
        expect(campo_parcelas[:innerText]).to match("#{@parcelas}x")
        expect(campo_numero_proposta).to eq(true)

        captura_de_proposta
        @response = @api_crediario_proposta.get(@codigo, @digito)

        expect(@response.code).to eq(200)
        expect(@response["contratoAlterado"]).to eq(false)
    end

    def captura_de_proposta
        captura = capturar_proposta[:innerText]

        quebra_valores = captura.split(' ') 
        proposta = quebra_valores.last
        quebra_proposta = proposta.split('-')
        @codigo = quebra_proposta.first
        @digito = quebra_proposta.last
        puts proposta
    end
end