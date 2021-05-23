require './dsl/web/page_objects/base_page'

module DSL
  module Web
    class HomePage < BasePage

      def initialize driver,config
        super driver,config
        visit
      end

      #####################
      ### page-objects ####
      #####################

      select_list :parking_lot_dropdown, :id => "ParkingLot"
      text_field :entry_date, :id => "StartingDate"
      text_field :entry_time, :id => "StartingTime"
      radio_button :entry_time_am, :css => "[name='StartingTimeAMPM'][value='AM']"
      radio_button :entry_time_pm, :css => "[name='StartingTimeAMPM'][value='PM']"
      text_field :leaving_date, :id => "LeavingDate"
      text_field :leaving_time, :id => "LeavingTime"
      radio_button :leaving_time_am, :css => "[name='LeavingTimeAMPM'][value='AM']"
      radio_button :leaving_time_pm, :css => "[name='LeavingTimeAMPM'][value='PM']"
      label :parking_cost, :css => ".SubHead>b"
      button :calculate, :css => "[value='Calculate']"

      #####################
      ###### methods ######
      #####################

      def select_entry_date_and_time entry_date, entry_time, entry_am_or_pm 
        self.entry_date = entry_date
        self.entry_time = entry_time
        $driver.find_element(:css => "[name='StartingTimeAMPM'][value='#{entry_am_or_pm.strip}']").click
      end  

      def select_leaving_date_and_time leaving_date, leaving_time, leaving_am_or_pm
        self.leaving_date = leaving_date
        self.leaving_time = leaving_time
        $driver.find_element(:css => "[name='LeavingTimeAMPM'][value='#{leaving_am_or_pm.strip}']").click
      end

    end #end of class
  end #end of Web
end #end of DSL
