
def to_file(file)
    return File.open(File.join(Dir.pwd, 'features/support/images', file))
end

Dado("que o usuário {string} possui {int} spots") do |email, int|
    @email = email
    @user_id = SpotApi.new.user_id(email)

    MongoDb.new.remove_my_spots(@user_id)

    spots = [
        { thumbnail: to_file("google.jpg"), company:  "Google", techs: "java", price: 10 },
        { thumbnail: to_file("yahoo.jpg"), company:  "Yahoo",  techs: "java", price: 10 },
        { thumbnail: to_file("qaninja.jpg"), company:  "QA Ninja",  techs:  "java", price: 10 },
        { thumbnail: to_file("acme.jpg"), company:  "Acme",  techs:  "java", price: 10 }
    ]

    spots.each do |spot|
        SpotApi.new.save_spot(spot, @user_id)
    end
end
  
Quando("eu acesso o Dashboard") do
    @login.with(@email)
    @dash.wait_until_spot_list_visible(wait: 5)
end
  
Então("devo ver a notificação {string}") do |expect_message|
    expect(page).to have_text expect_message
end