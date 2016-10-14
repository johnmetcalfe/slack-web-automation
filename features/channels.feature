Feature: Channels

  Scenario: Searching channels
    Given I am logged in and on the channels window
    When I search for a channel
    Then It should be displayed on the page

  Scenario: Create new private channel
    Given I am logged in and on the messaging page
    When I create a private channel
    Then It should appear in my list of channels

  Scenario: Create new public channel
    Given I am logged in and on the messaging page
    When I create a public channel
    Then It should appear in my list of channels

  Scenario: Sort channels by creation date
    Given I am logged in and on the channels window
    When I sort the channels by creation date
    Then They should be listed in date order

  Scenario: View archived channels
    Given I am logged in and on the channels window
    When I open archived channels
    Then I should see the archived channels

  Scenario: Change channel
    Given I am logged in and on general channel
    When I pick a different channel
    Then The channel should open

  Scenario: About channels
    Given I am logged in and on the channels window
    When I open about channels
    Then I should be redirected back to the messaging page
    And Be shown an alert box

  Scenario: Assert notifications
    Given I am logged in and on the messaging page
    When I receive a message
    Then The channel name should change to white

  Scenario: Change purpose of channel
    Given I am logged in and on the messaging page
    When I change the purpose of the channel
    Then It should be updated at the top of the page
