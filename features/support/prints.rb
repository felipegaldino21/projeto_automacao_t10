module Prints 

    def take_screenshot(name_file, folder)
        file = "#{folder}/#{name_file}.png"
        FileUtils.mkdir_p(folder) unless File.exist?
        Capybara;page.driver.browser.save_screenshot(file)
        attach(file, 'image/png')
    end

end