Feature: Profile

  Scenario: Change First Name
    Given I am on the profile page
    When I change the profile first name
    Then The first name should be updated on the page

  Scenario: Change Last Name
    Given I am on the profile page
    When I change the profile last name
    Then The last name should be updated on the page

  Scenario: Change What I Do
    Given I am on the profile page
    When I change the profile what I do
    Then The what I do should be updated on the page

  Scenario: Change Phone Number
    Given I am on the profile page
    When I change the profile phone number
    Then The phone number should be updated on the page

  Scenario: Change Skype
    Given I am on the profile page
    When I change the profile skype
    Then The skype should be updated on the page
