Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module PageObjects
  def base_screen
    @base_screen ||= BaseScreen.new
  end
  def api_autoriza
    @autoriza ||= APIAutoriza.new
  end
  def api_crediario_proposta
    @api_crediario_proposta ||= APICrediarioProposta.new
  end
  def identificar_cliente
    @identificar_cliente ||= IdentificarCliente.new
  end
  def selecionar_produto
    @selecionar_produto ||= SelecionarProduto.new
  end
  def carrinho
    @carrinho ||= Carrinho.new
  end
  def compra_produto
    @compra_produto ||= CompraProduto.new
  end
end

module Helper
  def tirar_foto(nome_arquivo, resultado)
    caminho_arquivo = "reports/screenshots/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(foto)
    attach(foto, "image/png")
  end
end