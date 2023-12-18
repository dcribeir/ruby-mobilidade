Before do
    visit '/Login'
    find('#UserName').set(CONFIG['email']) #Está configurado no arquivo de ambiente.
    find('#Password').set(CONFIG['senha']) #Está configurado no arquivo de ambiente.
    click_button(class: 'btn btn-success')

    find(class: 'select2-chosen').click
    find(class: 'select2-input').set('20.774.665/0001-60').send_keys(:enter)
    # click_button(class: 'btn btn-danger containe-select_account-button')
    sleep(5)
    find('#ToolboxV3').click
    sleep(5)

    find('input[type="file"]', :visible => false).set('features\support\teste-importacao.xls')
    # attach_file('DemandFile', 'features\support\teste-importacao.xls')
    sleep(2)
    # attach_file Rails.root.join('features\support\teste-importacao.xls')
    click_button(id: 'importEmployeeBaseDemandButton').click
    sleep(11)
end


After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/,'_').tr('/','_')
  
    if scenario.failed?
        tirar_foto(scenario_name.downcase!, 'falhou')
    else
        tirar_foto(scenario_name.downcase!, 'passou')
    end
end