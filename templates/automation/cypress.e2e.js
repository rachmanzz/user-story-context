// Cypress E2E Test Boilerplate
// Generated from BDD scenarios in includes/bdd-scenarios.md
// Copy this file to cypress/e2e/ and adjust selectors

describe('{Feature Name}', () => {
  beforeEach(() => {
    cy.visit('/{path}')
  })

  // === US-1: {Story Title} ===

  it('Scenario 1.1: {Happy path title}', () => {
    // Given
    cy.get('[data-testid=email-input]').type('user@example.com')
    cy.get('[data-testid=password-input]').type('Pass123!')
    // When
    cy.get('[data-testid=submit-btn]').click()
    // Then
    cy.url().should('include', '/dashboard')
    cy.get('[data-testid=user-name]').should('contain', 'User')
  })

  it('Scenario 1.2: {Error/edge case}', () => {
    // Given
    cy.get('[data-testid=email-input]').type('user@example.com')
    cy.get('[data-testid=password-input]').type('wrongpass')
    // When
    cy.get('[data-testid=submit-btn]').click()
    // Then
    cy.get('[data-testid=error-message]').should('be.visible')
    cy.url().should('not.include', '/dashboard')
  })
})
