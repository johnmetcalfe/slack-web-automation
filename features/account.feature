Feature: account

  Scenario: Edit username

    Given I am logged in as a user and on the Account pages
    When I click expand on username
    Then I should be able to enter a new username and click save
    And It should be updated in the username tab

  Scenario: Edit Password

    Given I am logged in as a user and on the Account pages
    When I click expand on password
    And Type in my current password
    And Type in a new password
    Then the account password should be updated

  Scenario: Edit email address

    Given I am logged in as a user and on the Account pages
    When I click expand on email address
    And Type in my current password for email
    And type in a new email address
    Then the email address for the account should be updated

  Scenario: Change Timezone

    Given I am logged in as a user and on the Account pages
    When I click expand on Timezone
    And I open the drop down menu
    And I select a different timezone
    Then the timeszone should be updated
