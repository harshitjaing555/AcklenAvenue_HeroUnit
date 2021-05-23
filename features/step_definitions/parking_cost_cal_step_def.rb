require 'rspec'

When(/^I select parking lot type as (.*)$/) do |parking_type|
    @app.home_page.parking_lot_dropdown = parking_type.strip
  end

When(/^I input entry date and time as (.*), (.*) and (.*)$/) do |entry_date, entry_time, entry_am_or_pm|
    @app.home_page.select_entry_date_and_time entry_date, entry_time, entry_am_or_pm
  end

When(/^I input leaving date and time as (.*), (.*) and (.*)$/) do |leaving_date, leaving_time, leaving_am_or_pm|
    @app.home_page.select_leaving_date_and_time leaving_date, leaving_time, leaving_am_or_pm
  end

When(/^I click on calculate button$/) do
    @app.home_page.calculate
  end

Then(/^The selected dropdown should remain as (.*)$/) do |parking_type|
    expect($driver.execute_script("return document.querySelector(\"[name='ParkingLot']\").selectedOptions[0].text").to_s==parking_type).to be_truthy
  end
  
Then(/^I estimated cost of parking is (.*)$/) do |cost|
    expect(@app.home_page.parking_cost==cost.strip).to be_truthy, "Expected Parking amount should be #{cost.strip} but got #{@app.home_page.parking_cost}"
  end