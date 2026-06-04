# Example: E-Commerce Checkout

---

## Epic: Checkout Flow

**EPIC-2 | Priority: Critical**

---

### US-4: Shopping Cart Review

**As a** customer
**I want** to review items in my shopping cart before checkout
**So that** I can confirm quantities and prices

**Priority:** Must | **Points:** 3

**Acceptance Criteria:**
1. Cart displays item name, quantity, unit price, and subtotal
2. User can update quantity (+/- buttons or direct input)
3. User can remove items from cart
4. Total price updates dynamically when quantity changes
5. Empty cart shows "Your cart is empty" with CTA to shop
6. Stock availability shown for each item

---

### US-5: Shipping Address Input

**As a** customer
**I want** to enter or select my shipping address
**So that** the order can be delivered to the right location

**Priority:** Must | **Points:** 3 | **Dependencies:** US-4

**Acceptance Criteria:**
1. Input fields: full name, phone, province, city, district, full address, postal code
2. Province/city dropdowns cascade (select province -> filter cities)
3. User can save multiple addresses and choose default
4. Address form validates phone number format and required fields
5. "Add new address" option available

**BDD Scenario:**

```
Scenario: Province/city cascade works correctly
  Given I am on the shipping address page
  When I select "Jawa Barat" as province
  Then the city dropdown shows only cities in Jawa Barat
  And "DKI Jakarta" is not listed
```

---

### US-6: Payment Method Selection

**As a** customer
**I want** to choose a payment method
**So that** I can pay conveniently

**Priority:** Must | **Points:** 2

**Acceptance Criteria:**
1. Supported methods: Bank Transfer, GoPay, OVO, COD
2. Selected method shown with clear instructions
3. Bank transfer displays account number and amount
4. E-wallet generates QR code or redirect link
5. COD shows estimated fee (if any)

---

### US-7: Order Confirmation

**As a** customer
**I want** to see an order confirmation after successful checkout
**So that** I know my order has been placed

**Priority:** Must | **Points:** 2 | **Dependencies:** US-5, US-6

**Acceptance Criteria:**
1. Order number generated and displayed
2. Summary: items, total, shipping address, payment method
3. Estimated delivery date shown
4. Confirmation email sent within 2 minutes
5. "Continue Shopping" button and "Track Order" link
6. Payment pending state clearly indicated
