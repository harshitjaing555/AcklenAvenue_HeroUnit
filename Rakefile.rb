# rake run:features["parking_cost_calculator.feature"] env=prod browser=chrome platform_name="web"

task "run:features", :feature do |t,arg|
  system "bundle exec cucumber -r ./features/step_definitions -r features/support features/#{arg[:feature]} --format pretty --format html --out ./target/parking_cost_calculator.html PLATFORM_NAME=#{ENV['PLATFORM_NAME']} env=#{ENV['env']} browser=#{ENV['browser']}"
end
