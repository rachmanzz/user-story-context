// Playwright Test Boilerplate
// Generated from BDD scenarios in includes/bdd-scenarios.md
// Copy this file to tests/ and adjust selectors

import { test, expect } from '@playwright/test'

test.describe('{Feature Name}', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/{path}')
  })

  // === US-1: {Story Title} ===

  test('Scenario 1.1: {Happy path title}', async ({ page }) => {
    // Given
    await page.fill('[data-testid=email-input]', 'user@example.com')
    await page.fill('[data-testid=password-input]', 'Pass123!')
    // When
    await page.click('[data-testid=submit-btn]')
    // Then
    await expect(page).toHaveURL(/\/dashboard/)
    await expect(page.locator('[data-testid=user-name]')).toContainText('User')
  })

  test('Scenario 1.2: {Error/edge case}', async ({ page }) => {
    // Given
    await page.fill('[data-testid=email-input]', 'user@example.com')
    await page.fill('[data-testid=password-input]', 'wrongpass')
    // When
    await page.click('[data-testid=submit-btn]')
    // Then
    await expect(page.locator('[data-testid=error-message]')).toBeVisible()
    await expect(page).not.toHaveURL(/\/dashboard/)
  })
})
