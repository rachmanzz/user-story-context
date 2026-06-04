# Technical Notes

---

## Architecture

| Aspect | Decision |
|--------|----------|
| **Platform** | Web (React + Node.js) |
| **Auth** | JWT tokens (access + refresh) |
| **Database** | PostgreSQL (users table) |
| **OAuth** | Google OAuth 2.0 |
| **Email** | SendGrid / SMTP |

---

## EPIC-1: User Authentication

### US-1: Email/Password Login
- Password hashed with bcrypt (salt rounds: 12)
- JWT access token: 15 min expiry
- JWT refresh token: 7 days expiry (30 days with "Remember me")
- Rate limit: 5 attempts / 15 min per IP + email combo

### US-2: Google OAuth
- Passport.js with GoogleStrategy
- Scopes: `profile`, `email`
- Auto-link: match by email, otherwise create new user

### US-3: Forgot Password
- Crypto.randomBytes(32) for reset token
- Token stored hashed in DB, expires 1 hour
- Rate limit: 1 email / 60 seconds

---

## Security Requirements

- All auth endpoints must use HTTPS
- Passwords never logged or returned in API responses
- Rate limiting on login and forgot-password endpoints
