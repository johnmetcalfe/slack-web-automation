
Feature: Message Bar
@wip
Scenario: Type and Send Message
  Given I am logged in
  And i have a conversation open
  When i send a message
  Then the message should appear as successfully sent

Scenario: Send Emojis
  Given I am logged in
  And i have a conversation open
  When i send an emoji
  Then the emoji should appear as successfully sent

Scenario: Send File
  Given I am logged in
  And i have a conversation open
  When i send a file
  Then the file should appear as being successfully sent

Scenario: Send Snippet
  Given I am logged in
  And i have a conversation open
  When i send a code snippet
  Then the snippet should appear as being successfully sent

Scenario: Create Post
  Given I am logged in
  And i have a conversation open
  When i send a post
  Then the snippet should appear as being successfully sent

Scenario: send giphy on general
  Given I am logged in
  And i have the general channel open
  When i send a giphy
  Then the giphy should appear as being successfully sent on general

Scenario: send @here
  Given I am logged in
  And i have the general channel open
  When i send a @here
  Then the @here message should appear as being successfully sent on general
  And all members receive a notification

Scenario: send @channel
  Given I am logged in
  And i have the general channel open
  When i send a @channel
  Then the @channel message should appear as being successfully sent on general
  And all members receive a notification
