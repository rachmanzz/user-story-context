# Acceptance Criteria

---

## US-1: Login with Email & Password

1. [ ] User can enter email and password into form fields
2. [ ] Email format is validated before submission
3. [ ] Error "Invalid email or password" for invalid credentials
4. [ ] Successful login redirects to dashboard
5. [ ] 5 failed attempts triggers 15-minute lockout
6. [ ] "Remember me" persists session for 30 days

---

## US-2: Login with Google OAuth

1. [ ] "Login with Google" button visible on login page
2. [ ] Redirects to Google consent screen
3. [ ] Successful OAuth creates account if new user
4. [ ] Cancelled OAuth returns to login page
5. [ ] Error message if OAuth fails

---

## US-3: Forgot Password

1. [ ] "Forgot password?" link on login page
2. [ ] Email input to receive reset link
3. [ ] Reset email sent within 30 seconds
4. [ ] Reset link expires after 1 hour
5. [ ] New password: min 8 chars, 1 uppercase, 1 number
6. [ ] Confirmation page after successful reset
