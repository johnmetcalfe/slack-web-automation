Feature: Account

  Scenario: Edit Username

    Given I am logged in as a user and on the Account pages
    When I enter a new username and click save
    Then It should be updated in the username section


  # Scenario: Edit Password

  #   Given I am logged in as a user and on the Account pages
  #   When I change my password
  #   Then The account password should be updated

  Scenario: Edit Email Address

    Given I am logged in as a user and on the Account pages
    When I change my email address
    Then The email address for the account should be updated
  
  Scenario: Change Timezone

    Given I am logged in as a user and on the Account pages
    When I change the timezone
    Then The timezone should be updated
