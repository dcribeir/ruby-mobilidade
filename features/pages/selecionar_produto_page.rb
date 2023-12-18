class SelecionarProduto < SitePrism::Page
    set_url '/pesquisa'

    #Elementos
    element :campo_pesquisar_produto, 'input[class="qa-core-product-search-write ng-pristine ng-invalid ng-touched"]'
    element :botao_pesquisar_produto, 'button[class="is-icon qa-core-search-for-products-click"]'
    def clicar_produto_lista(codigo)
        find("h3[class='qa-catalog-product-name-read #{codigo}']")
    end
    element :botao_simular, 'button[class="is-button button-simulador"]'
    element :botao_adicionar, 'button[class="qa-catalog-description-footer-addcart-button-click main-action"]'
    element :botao_simular_produto, 'button[class="main-action"]'
    element :campo_codigo_produto, 'span[class="data-label"]', :text => 'Código do produto'
    def botao_garantia_estendida(garantia)
        find("label[for='#{garantia}--0']")
    end


    #Métodos
    def pesquisar_produto(codigo, garantia)
        campo_pesquisar_produto.set(codigo)
        botao_pesquisar_produto.click
        clicar_produto_lista(codigo).click
        if garantia != nil
            botao_garantia_estendida(garantia).click
        end
        botao_adicionar.click
    end
end