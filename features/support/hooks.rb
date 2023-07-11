require_relative 'prints.rb'


Before do |scenario|
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    Capybara.page.driver.browser.manage.window.maximize
end
 
After do |scenario|

    time = Time.now
    date = time.strftime("%d-%m-%Y")
    hour = time.strftime("%k-M-%S")
    folder_p = "screenshots/#{date}/"
    cenario = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    nome = "#{hour}-#{cenario}"

    if scenario.failed?
        take_screenshot(nome, "#{folder_p}/test_failed")
    else 
        take_screenshot(nome, "#{folder_p}/test_passed")
    end
    
end