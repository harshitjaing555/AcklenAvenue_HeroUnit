require './dsl/domain_sepcific_lang'
require 'logging'

$dunit = false # This variable is used as I don't want to executed setup method again and again for each scenario
$logger = Logging.logger(STDOUT)

Before do

  if $dunit
    @app = $app
  else
    setUp
  end
  $dunit = true
end

def setUp
  @app = DSL::DomainSpecificLang.new
  $app = @app
  $logger.info "Application is Successfully launched"
end


After do |scenario|
  if (scenario.status != :passed)
    encoded_img = $driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png', "Failure Screenshot:")
  end
end

 at_exit do
   $driver.quit
 end
