# slack-web-automation 
This project is designed to use cucumber to conduct automated tests on the slack web application. Some areas it tests include:
- Login
- Accounts
- Messaging
- Channels

Login Details are stored in a separate file which is read in when such information is required.
They are located in a file called 'users.yml'. 

Timezones are passed in using an external yaml file. currently it follows the following format: 

Timezones:
  - "Europe/Amsterdam"
  - "Europe/London"
  
The first element is what the tester wants the test users timezone to be changed to. With the second element being what
the tester wants the timezone to be changed back to. 


  
