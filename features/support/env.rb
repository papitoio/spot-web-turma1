require "capybara"
require "capybara/cucumber"
require "mongo"
require "selenium-webdriver"
require "site_prism"

case ENV["BROWSER"]
when "headless"
    @driver = :selenium_chrome_headless
when "chrome"
    @driver = :selenium_chrome
else
    raise "Invalid browser"
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = "https://spotlab.herokuapp.com"
    config.default_max_wait_time = 5
end

# Adicionando um novo metodo na classe String o ruby
class String
    def to_mongo_id
        BSON::ObjectId.from_string(self)
    end
end