
Feature: Direct Messages Section
As an employee
I want to directly message people
so that I can communicate privately with colleagues
@wip
Scenario: Start a direct message with a single person
  Given i am logged in
  When i start a direct message with a single person
  Then i should see the direct message window with a single recipient
@wip
Scenario: Start a direct message with multiple people
  Given i am logged in
  When i start a direct message with multiple people
  Then i should see the direct message window with multiple recipients
@wip
Scenario: Change direct message conversation
  Given i am logged in
  And currently in a direct message conversation
  When i select a different conversation
  Then i should see the newly selected direct message window
@wip
Scenario: Assert notifications
  Given i am logged in
  When i receive a direct message
  Then i should see a notification next to the direct message
