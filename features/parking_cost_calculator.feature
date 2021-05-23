Feature: Parking Cost calculator

  Scenario Outline: Calculating cost of parking depending upon the type of parking you select

    When I select parking lot type as <parking_type>
    And I input entry date and time as <entry_date>, <entry_time> and <entry_am_or_pm>
    And I input leaving date and time as <leaving_date>, <leaving_time> and <leaving_am_or_pm>
    And I click on calculate button
    And I estimated cost of parking is <parking_cost>

    Examples:
      | parking_type             | entry_date | entry_time | entry_am_or_pm | leaving_date | leaving_time | leaving_am_or_pm | parking_cost |
      | Valet Parking            | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 12.00      |
      | Valet Parking            | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 05:01        | AM               | $ 18.00      |
      | Valet Parking            | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 05:01        | PM               | $ 18.00      |
      | Valet Parking            | 5/14/2021  |  12:00     | AM             | 5/15/2021    | 05:01        | AM               | $ 36.00      |
      | Valet Parking            | 5//14//2021|  12:00     | AM             | 5//15//2021  | 05:01        | AM               | $ 36.00      |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 01:01        | AM               | $ 3.00       |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:31        | PM               | $ 24.00      |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 11:01        | AM               | $ 23.00      |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/15/2021    | 06:30        | AM               | $ 37.00      |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 04:01        | AM               | $ 9.00       |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 06:31        | PM               | $ 9.00       |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/15/2021    | 05:01        | AM               | $ 18.00      |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/19/2021    | 05:59        | AM               | $ 54.00      |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 04:01        | AM               | $ 10.00      |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 06:31        | PM               | $ 12.00      |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/15/2021    | 06:01        | AM               | $ 24.00      |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/19/2021    | 06:59        | AM               | $ 72.00      |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/14/2021    | 04:01        | AM               | $ 10.00      |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/14/2021    | 06:31        | PM               | $ 10.00      |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/15/2021    | 06:01        | AM               | $ 20.00      |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/19/2021    | 06:59        | AM               | $ 60.00      |


  Scenario Outline: Parking type remains selected even clicking on calculate button

    When I select parking lot type as <parking_type>
    And I input entry date and time as <entry_date>, <entry_time> and <entry_am_or_pm>
    And I input leaving date and time as <leaving_date>, <leaving_time> and <leaving_am_or_pm>
    And I click on calculate button
    Then The selected dropdown should remain as <parking_type>

    Examples:
      | parking_type             | entry_date | entry_time | entry_am_or_pm | leaving_date | leaving_time | leaving_am_or_pm | parking_cost |
      | Valet Parking            | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 12.00      |
      | Short-Term Parking       | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Economy Parking          | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Long-Term Garage Parking | 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |
      | Long-Term Surface Parking| 5/14/2021  |  12:00     | AM             | 5/14/2021    | 12:01        | AM               | $ 2.00       |