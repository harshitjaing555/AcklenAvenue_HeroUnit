require 'page-object'

module DSL
  module Web
    class BasePage
      include PageObject
      def initialize driver,config
        super driver,30
        @driver = driver
        @config = config
      end

      def visit
        if ENV['env'] == ""
          env_url = @config.prod.app_url
        else
          env_url = @config[ENV['env']]['app_url']
        end
        @driver.get env_url
      end

    end #end of class
  end #end of Web
end #end of DSL
