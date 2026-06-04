# BDD Scenarios

---

## US-1: Login with Email & Password

### Scenario 1.1: Successful login

```
Feature: Login with Email & Password
  As a registered customer
  I want to log in using my email and password
  So that I can access my account and shop

  Scenario: Successful login with valid credentials
    Given I am registered with email "user@example.com" and password "Pass123!"
    When I enter valid credentials and click Masuk
    Then I am redirected to the dashboard
    And my name appears in the header
```

### Scenario 1.2: Invalid password

```
  Scenario: Login with incorrect password
    Given I have an account with email "user@example.com"
    When I enter a wrong password
    Then I see "Invalid email or password"
    And I stay on the login page
```

### Scenario 1.3: Account lockout

```
  Scenario: Account locked after 5 failed attempts
    Given I have failed login 5 times
    When I attempt to log in again
    Then I see "Account locked for 15 minutes"
    And the login button is disabled for 15 minutes
```

---

## US-2: Login with Google OAuth

### Scenario 2.1: First-time Google login

```
Feature: Login with Google OAuth
  As a user
  I want to log in using Google
  So that I don't need another password

  Scenario: First-time login creates account
    Given I have a Google account "user@gmail.com"
    When I click "Login with Google"
    And I approve the consent screen
    Then a new account is created for "user@gmail.com"
    And I am logged in automatically
```
