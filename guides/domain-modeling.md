# Domain Modeling Guide

Domain modeling helps identify entities, relationships, and boundaries before writing user stories.

---

## Process

### 1. Identify Key Entities
Nouns found in feature descriptions. Examples: User, Order, Product, Payment.

### 2. Define Relationships
How entities connect:
- User **has many** Orders
- Order **has many** OrderItems
- Order **belongs to** User

### 3. Identify Aggregates
Group entities that change together:
- Order aggregate: Order + OrderItems + ShippingAddress + Payment
- User aggregate: User + Profile + Settings

### 4. Define Bounded Contexts
Separate domains with clear boundaries:
- **Authentication Context**: User registration, login, roles
- **Catalog Context**: Products, categories, inventory
- **Order Context**: Cart, checkout, order management
- **Payment Context**: Transactions, refunds, invoices

## Quick Domain Model Template

```
[Bounded Context: {name}]
  Entities:
    - {Entity}: {description}
      - Attributes: {list}
      - Behaviors: {list}

  Value Objects:
    - {VO}: {immutable object}

  Domain Services:
    - {Service}: {operation}

  Repository:
    - {Repository}: {data access}
```

## Example

```
[Bounded Context: Order]
  Entities:
    - Order:
      - Attributes: id, userId, status, totalAmount, createdAt
      - Behaviors: place(), cancel(), ship(), return()

    - OrderItem:
      - Attributes: productId, quantity, unitPrice
      - Behaviors: updateQuantity(), calculateSubtotal()

  Value Objects:
    - Money: amount, currency
    - Address: street, city, province, postalCode

  Domain Services:
    - PricingService: calculateDiscount(), applyPromo()
    - ShippingService: calculateFee(), estimateDelivery()

  Repository:
    - OrderRepository: save(), findById(), findByUser()
```
