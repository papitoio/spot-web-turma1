
Quando("eu submeto a sessao com {string}") do |email|
    @login.with(email)
end
  
Então("devo ver a área de administração de spots") do
    expect(@dash.has_dashboard?).to be true
end
  
Entao("devo ver a mensagem de alerta: {string}") do |expect_alert|
    expect(@login.alert).to have_text(expect_alert)
end
