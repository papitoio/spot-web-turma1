
Dado("que estou logado como {string}") do |email|
    @login.with(email)
    @dash.wait_until_dashboard_visible(wait: 5)

    js_script = "return window.localStorage.getItem('user');"
    @user_id = page.execute_script(js_script)
end

Dado("não tenho spots cadastrados") do
    MongoDb.new.remove_my_spots(@user_id)
end

Dado("que eu tenho o seguinte spot:") do |table|
    @spot_data = table.rows_hash    
end

Dado("este é um novo spot") do
    MongoDb.new.remove_spot(@spot_data["company"], @user_id)
end

Quando("eu faço o cadastro dessas informações") do
    @dash.go_to_form
    @dash.form.create(@spot_data)
end

Então("devo ver um novo spot com o valor da diária {string}") do |price|
  expect(@dash.item(@spot_data["company"])).to have_text price
end


Então("devo ver uma mensagem de alerta {string} no dashboard") do |expect_message|
    expect(@dash.alert).to have_text expect_message
end