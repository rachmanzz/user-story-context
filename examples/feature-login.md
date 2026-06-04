# Example: Login Feature

---

## Epic: User Authentication

**EPIC-1 | Priority: Critical**

---

### US-1: Login with Email & Password

**As a** registered user
**I want** to log in using my email and password
**So that** I can access my account securely

**Priority:** Must | **Points:** 3 | **Dependencies:** None

**Acceptance Criteria:**
1. User can enter email and password in login form
2. Form validates email format and non-empty password
3. Error message shown for invalid credentials
4. Successful login redirects to dashboard
5. Failed attempts > 5 trigger 15-minute lockout
6. "Remember me" checkbox persists session for 30 days

**BDD Scenarios:**

```
Scenario: Successful login with valid credentials
  Given I am a registered user with email "user@example.com" and password "Pass123!"
  When I enter valid credentials and click Login
  Then I am redirected to the dashboard
  And my name appears in the header

Scenario: Login with incorrect password
  Given I am a registered user with email "user@example.com"
  When I enter an incorrect password
  Then I see error message "Invalid email or password"
  And I remain on the login page

Scenario: Account locked after 5 failed attempts
  Given I have failed login 5 times
  When I attempt to log in again
  Then I see "Account locked for 15 minutes"
  And login is disabled for 15 minutes
```

**Technical Notes:**
- Use JWT for session tokens
- Password must be hashed with bcrypt
- Rate limiting: max 5 attempts per 15 minutes per IP

---

### US-2: Login with Google OAuth

**As a** user
**I want** to log in using my Google account
**So that** I don't need to remember another password

**Priority:** Should | **Points:** 5 | **Dependencies:** US-1

**Acceptance Criteria:**
1. "Login with Google" button visible on login page
2. OAuth flow redirects to Google consent screen
3. Successful auth creates/links account automatically
4. First-time Google login completes profile setup
5. Error handled if Google auth is cancelled

---

### US-3: Forgot Password

**As a** user who forgot my password
**I want** to reset my password via email
**So that** I can regain access to my account

**Priority:** Must | **Points:** 3 | **Dependencies:** US-1

**Acceptance Criteria:**
1. "Forgot password" link on login page
2. Email input field to receive reset link
3. Reset link sent within 30 seconds
4. Link expires after 1 hour
5. New password must meet strength requirements (min 8 chars, 1 uppercase, 1 number)
6. Confirmation page shown after successful reset
