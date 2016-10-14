Feature: Direct Messages Section
As an employee
I want to directly message people
so that I can communicate privately with colleagues

Scenario: Find a direct message conversation
  Given i am logged in
  And have at least one direct message conversation
  When i search for a conversation
  Then i should see the conversation available

Scenario: Start a direct message with a single person
  Given i am logged in
  When i start a direct message with a single person
  Then i should see the direct message window with a single recipient

Scenario: Start a direct message with multiple people
  Given i am logged in
  When i start a direct message with multiple people
  Then i should see the direct message window with multiple recipients

Scenario: Change direct message conversation
  Given i am logged in
  And currently in a direct message conversation
  When i select a different conversation
  Then i should see the newly selected direct message window

Scenario: Assert notifications
  Given i am logged in
  When i receive a direct message
  Then i should see a notification next to the direct message
