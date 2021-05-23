require './dsl/web/page_objects/home_page'
require 'hash-to-ostruct'
require 'selenium-webdriver'

module DSL
  class DomainSpecificLang

    attr_accessor :home_page, :config
    def initialize config = "./config.yaml"
      @config = YAML.load_file(config).to_ostruct

      ######################
      # execution-platform #
      ######################

      if ENV['PLATFORM_NAME'] == ""
        $platform = @config.PLATFORM_NAME.downcase
      else
        $platform = ENV['PLATFORM_NAME'].downcase
      end

      case $platform

      when 'web'

        initialize_driver
        $driver.manage.window.maximize
        $wait = Selenium::WebDriver::Wait.new(:timeout => 15)
        @home_page = DSL::Web::HomePage.new $driver, @config

      when 'android_phone'

        #Code specific to Android Phone

      when 'android_tablet'

        #Code specific to Android Tablet

      when 'ipad'

        #Code specific to Android Tablet

      when 'iphone'

        #Code specific to Android Tablet

      end #end of case

    end #end of initialize block

    ###########################
    # initializing web driver #
    ###########################

    def initialize_driver
      if ENV['browser'] == ""
        browser_sym = @config.browser.downcase.to_sym
      else
        browser_sym = ENV['browser'].downcase.to_sym
      end

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 40 # seconds
      exec_mode = @config.execution_mode.to_s.downcase
      if exec_mode == "local"
        Selenium::WebDriver::Chrome.driver_path="#{File.dirname(__FILE__)}/drivers/chromedriver.exe"
        $driver = Selenium::WebDriver.for(browser_sym, :http_client => client)
      elsif exec_mode == "remote"
        initializing_remote_web_driver browser_sym, client
      end
    end

    def initializing_remote_web_driver browser_sym, client
      if(browser_sym == "firefox")
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile.native_events = false
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
        $driver = Selenium::WebDriver.for(:remote, :url => @config.server, :desired_capabilities => capabilities, :http_client => client)
      else
        $driver = Selenium::WebDriver.for(:remote, :url => @config.server, :desired_capabilities => browser_sym, :http_client => client)
      end
    end

  end #end of class
end #end of DSL
