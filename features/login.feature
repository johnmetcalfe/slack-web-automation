Feature: Slack Login
As an employee
I want to log in to my account
so that I can communicate with colleagues

Scenario: Valid Details
  Given i am on the sign in page
  When i login with valid details
  Then i should see the general slack channel

Scenario: Invalid Details
  Given i am on the sign in page
  When i enter a valid team name
  And i attempt to log in with invalid details
  Then i should see an error message

Scenario: Invalid channel valid login
  Given i am on the sign in page
  When i enter a valid teamname that i am not a member of
  And i login with valid details
  Then i should see an error message

Scenario: Non-existent channel
  Given i am on the sign in page
  When i attempt to login with an invalid team name
  Then i should see an error message
