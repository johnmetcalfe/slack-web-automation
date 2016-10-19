Feature: Sidebar Nav

  Scenario: profile and account
    Given I am logged in and on the messaging window
    When I navigate to profile and account
    Then A sidebar should be shown

  Scenario: Preferences
    Given I am logged in and on the messaging window
    When I navigate to preferences
    Then I should be taken to the preferences page

#  Scenario: Set yourself to away
#    Given I am logged in and on the messaging window
#    When I set myself to away
#    Then My account should be away

  Scenario: Help and Feedback
    Given I am logged in and on the messaging window
    When I naviagte to Help and Feedback
    Then I should be taken to the help page

  Scenario: Invite People
    Given I am logged in and on the messaging window
    When I click invite people
    Then I should be taken to the page to invite people
