class IdentificarCliente < SitePrism::Page
    
    #Formulário
    element :tela_identificar_cliente, 'div[class="session-data qa-core-service-popover-click"]'
    element :botao_sair, 'button[class="logout qa-core-nav-click quit"]'
    element :botao_identificar_cliente, 'button[class="is-full qa-core-id-client-click"]'
    element :campo_cpf_cnpj, '#input-document'
    element :botao_limpar, 'button[class="is-secondary"]'
    element :botao_identificar_cliente_nome, 'button[class="is-link instructions qa-core-modal-identification-client-name-click-link"]'
    element :campo_nome, '#input-nome'
    element :campo_data_nascimento, '#input-data-nascimento'
    element :botao_identificar, 'button[class="main-action qa-core-id-client-click"]'
    element :botao_voltar, 'button[class="secondary-action"]'
    element :botao_cadastro, 'button[class="customer-action show-profile qa-core-client-profile-click"]'
    element :botao_solicitar_cartao, 'div[class="private-label-credit-card-request"]', :text => 'Solicitar cartão'
    element :botao_encerrar_atendimento, 'button[class="is-link close-attendance qa-core-cancel-service-click"]'
    element :botao_novo_atendimento, 'button[class="is-secondary qa-core-start-new-service-click"]'
    element :campo_pesquisar_produto, 'input[class="qa-core-product-search-write ng-pristine ng-invalid ng-touched"]'
    element :botao_pesquisar_produto, 'button[class="is-icon qa-core-search-for-products-click"]'
    element :cliente_identificado, 'div[class="customer-name qa-core-client-name-read"]'
    element :botao_sim_tenho_certeza, 'button[class="qa-core-interrupt-service-yes-click"]'
    element :botao_voltar_identificacao, 'button[is-secondary qa-core-interrupt-service-no-click]'


    #Métodos
    def selecionar_cliente(cliente)
        tela_identificar_cliente.click

        encerrar_atendimento

        botao_identificar_cliente.click
        campo_cpf_cnpj.set(cliente)
        botao_identificar.click
        campo_pesquisar_produto.click
        sleep(3)
    end

    def encerrar_atendimento
        if page.has_css?('button[class="is-secondary qa-core-start-new-service-click"]')
            puts "Cliente Identidicado"
            
            botao_encerrar_atendimento.click
            botao_sim_tenho_certeza.click
        else 
            puts "Cliente não Identificado"
        end
    end

    def novo_atendimento(cliente)
        
    end

    def solicitar_cartao
        
    end

    def acessar_cadastro
        
    end

    def esperar_elemento(elemento)
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        consulta = wait.until{elemento}
    end
end