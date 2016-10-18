Feature: Profile

  Scenario: Change First Name
    Given I am on the profile page
    When I change the profile First Name
    Then The First Name should be updated on the page

  Scenario: Change Last Name
    Given I am on the profile page
    When I change the profile Last Name
    Then The Last Name should be updated on the page

  Scenario: Change What I Do
    Given I am on the profile page
    When I chaneg the profile What I DO
    Then The What I Do should be updated on the page

  Scenario: Change Phone Number
    Given I am on the profile page
    When I change the profile Phone Number
    Then The Phone Number shold be update on the page

  Scenario: Change Skype
    Given I am on the profile page
    When I Change the profile Skype
    Then The Skype should be updated on the page
