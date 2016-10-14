Feature: Slack Login
As an employee
I want to communicate with colleagues
so that I can speak about a given subject efficiently

Scenario: Valid Details
  Given i am on the sign in page
  When i enter the team name
  And i enter my valid email and password
  And i click sign in
  Then i should see the general slack channel

Scenario: Invalid Details
  Given i am on the sign in page
  When i enter the team name
  And i enter my invalid email and password
  And i click sign in
  Then i should see an appropriate error message

Scenario: Invalid channel valid login
  Given i am on the sign in page
  When i enter the incorrect but a valid team name
  And i enter my valid email and password
  And i click sign in
  Then i should see an appropriate error message

Scenario: Non-existent channel
  Given i am on the sign in page
  When i enter an invalid team name
  Then i should see an appropriate error message
