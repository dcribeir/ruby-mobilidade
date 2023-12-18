class BaseScreen

#Método para esperar um elemento mapeado estar visível na tela por xpath durante 10s. 
def wait_for_xpath(xpath, timeout = 10)
    @driver.wait_true(timeout) do
        @driver.exists { @driver.find_element(:xpath, xpath) }
    end
end

#Método para esperar um elemento mapeado estar visível na tela por id durante 10s.
def wait_for_id(id, timeout = 10)
    @driver.wait_true(timeout) do 
        @driver.exists { @driver.find_element(:id, id) }
    end
end
#Método para esperar um elemento mapeado estar visível na tela por id e text durante 10s.
def wait_for_id_text(id, text, timeout = 10)
    @driver.wait_true(timeout) do 
        @driver.exists { @driver.find_elements(:id, id).text(text) }
    end
end

#Método para esperar um elemento mapeado estar visível na tela por class e text durante 10s.
def wait_for_class_text(tipo, text, timeout = 10)
    @driver.wait_true(timeout) do 
        @driver.exists { @driver.find_elements(:class, tipo).text(text) }
    end
end

#Método para consultar um elemento mapeado com dois atributos, id e xpath.
def click_id_xpath(id, xpath)
    #@driver.find_element(id: id).find_element(xpath: "//android.widget.CheckedTextView[@text='#{@texto}']").click
    @driver.find_element(id: id).find_element(xpath: xpath).click
end

#Método para consultar um elemento mapeado com dois atributos, id e id.
def click_id_id(id, id2)
    @driver.find_element(id: id).find_element(id: id2).click
end

#Método para clicar um elemento mapeado com dois atributos, id e text.
def click_id_text(id, text)
    @driver.find_elements(id: id).text(text).click
end

#Método para clicar um elemento mapeado com dois atributos, xpath e text.
def click_xpath_text(xpath, text)
    @driver.find_elements(xpath: xpath).text(text).click
end

#Método para clicar um elemento mapeado com dois atributos, class e text.
def click_class_text(tipo, text)
    @driver.find_elements(class: tipo).text(text).click
end

#Método para clicar em um elemento mapeado com dois elementos((ID, INDEX), (ID)).
def click_id_index_id(id, index, id2)
    @driver.find_elements(id: id).index(index).find_element(id: id2).click
end

#Método para consultar um elemento mapeado com um atributo, id.
def find_id(id)
    @driver.find_element(id: id)
end

#Método para consultar um elemento mapeado com dois atributos, id e text.
def find_id_text(id, text)
    @driver.find_elements(id: id).text(text)
end

#Método para consultar e retornar o text de um elemento mapeado na tela por id.
def find_id_get_text(id)
    @driver.find_element(:id, id).text
end

#Método para consultar e retornar o text de um elemento mapeado com dois atributos, id e text.
def find_id_text_get_text(id, text)
    @driver.find_elements(id: id).text(text).text
end

#Método para consultar e retornar o text de um elemento mapeado com dois elementos((ID, INDEX), (ID)).
def find_id_index_id_get_text(id, index, id2)
    @driver.find_elements(id: id).index(index).find_element(id: id2).text
end

#Método para consultar um elemento mapeado com dois atributos, class e text.
def find_class_text(tipo, text)
    @driver.find_elements(class: tipo).text(text)
end

#Método para consultar e retornar o text de um elemento mapeado com dois atributos, class e text.
def find_class_text_get_text(tipo, text)
    @driver.find_elements(class: tipo).text(text).text
end

#Método para consultar e retornar se o mesmo está ativo. Mapeado com id.
def find_id_get_enabled(id)
    @driver.find_element(id: id).attribute('enabled')
end

#Método para consultar e retornar se o mesmo está selecionado. Mapeado com id.
def find_id_get_selected(id)
    @driver.find_element(id: id).attribute('selected')
end

#Método para consultar e retornar se o mesmo está clicável. Mapeado com id.
def find_id_get_clickable(id)
    @driver.find_element(id: id).attribute('clickable')
end

#Método para clicar um elemento mapeado na tela por id.
def click_id(id)
    @driver.find_element(:id, id).click
end

#Método para clicar um elemento mapeado na tela por xpath.
def click_xpath(xpath)
    @driver.find_element(:xpath, xpath).click
end

#Método para clicar um elemento mapeado na tela por class.
def click_class(valor)
    @driver.find_element(:class, valor).click
end

#Método para preencher um campo mapeado na tela por id.
def send_keys_id(id, field)
    @driver.find_element(:id, id).send_keys(field)
end

#Método para preencher um campo mapeado na tela por xpath.
def send_keys_xpath(xpath, field)
    @driver.find_element(:xpath, xpath).send_keys(field)
end

#Método para preencher um campo mapeado na tela por class.
def send_keys_class(tipo, field)
    @driver.find_element(:class, tipo).send_keys(field)
end
end