require 'report_builder'

Before do
    page.current_window.resize_to(1920, 1080)

    @login = LoginPage.new
    @dash = DashPage.new

    @login.load
end

# After do
#     # puts "tudo aqui, acontece depois do cenario"
#     temp_shot = page.save_screenshot('logs/temp_shot.png') # capybara salva o print da tela
#     file_shot = File.open(temp_shot, 'rb').read # ruby le e retorna o arquivo
#     final_shot = Base64.encode64(file_shot) # ruby convete para binario
#     embed(final_shot, 'image/png', 'Screenshot') # cucumber salva no report
# end

After do |scenario|
  screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Screenshot")
end


at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'logs/report.json'
    config.report_path = 'logs/report'
    config.report_types = [:html]
    config.report_title = 'Spotlab - Regression Tests'
    config.color = 'indigo'
    config.compress_images = true
  end
  ReportBuilder.build_report
end