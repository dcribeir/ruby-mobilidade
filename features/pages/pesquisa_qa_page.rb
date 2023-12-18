include RSpec::Matchers
#require File.expand_path("features/pages/identificar_cliente_page")
#require File.expand_path("features/pages/selecionar_produto_page")

class PesquisaQA < SitePrism::Page 

    def initialize
        @identificar_cliente = IdentificarCliente.new
        @selecionar_produto = SelecionarProduto.new
    end
    
    set_url '/pesquisa'

    #Formulário
    element :campo_nome, '#nf-field-5'
    element :campo_sobrenome, '#nf-field-6'
    element :campo_email, '#nf-field-7'
    element :campo_email_confirmacao, '#nf-field-8'
    element :campo_telefone, '#nf-field-17'
    element :campo_idade_18_30, '#nf-label-class-field-10-0'
    element :campo_idade_31_49, '#nf-label-class-field-10-1'
    element :campo_idade_49_mais, '#nf-label-class-field-10-2'
    element :campo_tempo_area, '#nf-field-11'
    element :campo_atrai_area, '#nf-field-12'
    element :campo_melhor, 'input[class="ninja-forms-field nf-element "]'
    element :campo_melhorar_tecnico, '#nf-label-class-field-13-0'
    element :campo_melhorar_negocio, '#nf-label-class-field-13-1'
    element :campo_melhorar_comunicacao, '#nf-label-class-field-13-2'
    element :campo_melhorar_lideranca, '#nf-label-class-field-13-3'
    element :campo_melhorar_todas, '#nf-label-class-field-13-4'
    element :campo_linguagem, '#nf-field-14'
    element :campo_resumo_carreira, '#nf-field-15'

    #Botões
    element :botao_enviar, '#nf-field-16'

    #Mensagens
    element :mensagem_sucesso, 'div[class="nf-form-wrap ninja-forms-form-wrap"]', :text => 'Your form has been successfully submitted.'

    #Métodos
    def alt_variaveis(operador)
        if operador == 'Incluir'
            @cpf_cnpj = '06167409641'
            @produto = '311219'
        elsif operador == 'Alterar'
            @cpf_cnpj = '35752954843'
            @produto = '311219'
        end
    end

    def teste(operador)
        alt_variaveis(operador)

        @identificar_cliente.selecionar_cliente(@cpf_cnpj)
        @selecionar_produto.pesquisar_produto(@produto)




        #campo_nome.set(@nome)
        #campo_sobrenome.set(@sobrenome)
        #campo_email.set(@email)
        #campo_email_confirmacao.set(@email_confirmacao)
        #campo_telefone.set(@telefone)
        #selecionar_idade(@idade)
        #campo_tempo_area.find('option', :text => @tempo_area).select_option
        #campo_atrai_area.find('option', :text => @atrai_area).select_option
        #selecionar_melhoria(@melhorar)
        #campo_linguagem.set(@linguagem)
        #campo_resumo_carreira.set(@resumo_carreira)
#
        #botao_enviar.click
        #
        #esperar_elemento(mensagem_sucesso)
    end

    def validacao
        expect(mensagem_sucesso[:innerText]).to eq(@resultado)
    end

    def selecionar_idade(idade)
        if idade == '18_30'
            campo_idade_18_30.click
        elsif idade == '31_49'
            campo_idade_31_49.click
        elsif idade == '49+'
            campo_idade_49_mais.click
        end
    end

    def selecionar_melhoria(melhorar)
        if melhorar == 'Tecnico'
            campo_melhorar_tecnico.click
        elsif melhorar == 'Negocio'
            campo_melhorar_negocio.click
        elsif melhorar == 'Comunicacao'
            campo_melhorar_comunicacao.click
        elsif melhorar == 'Lideranca'
            campo_melhorar_comunicacao.click
        elsif melhorar == 'Todas'
            campo_melhorar_todas.click
        end
    end

    def esperar_elemento(elemento)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        consulta = wait.until{elemento}
    end
end