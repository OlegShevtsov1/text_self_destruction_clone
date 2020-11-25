# README

Build a web application which creates a text self-destructing ​ messages​ .
Flow:
1. User posts message to the ​ REST API​ endpoint
2. App generates a link and returns it as a response
3. User can do request to the provided link and see saved message only once
4. On second request info message “You already requested this message” should be
returned

Cover your application with the unit tests using rspec.

Push the code to Bitbucket or Github.

Deploy your application to Heroku.

Provide links to the codebase and app.

Bonus points for implementing:

1. Messages stored on the server side should be encrypted using AES algorithm (you
can use any library for text encryption)
2. Messages should be encrypted on frontend side using password and should be sent
to backend in encrypted format (to view message user should enter a right password)

Please pay attention to the best practices for REST API design, error handling and status
codes.
