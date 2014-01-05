Feature: sign in

  Scenario: unsuccessful sign in
    Given a user is on the sign in page
    When  he submits invalid sign in information
    Then  he should see an error message

  Scenario: successful sign in
    Given a user is on the sign in page
    And   the user has an account
    And   the user submit valid sign in information
    Then  he should be on his profile page
    And   he should see a sign out link
