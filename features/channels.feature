Feature: Channels

  Scenario: Searching channels
    Given I am logged in and on the channels window
    When I search for a channel
    Then It should be displayed on the page

    Scenario: 
