# Cucumber Feature File Boilerplate
# Generated from includes/bdd-scenarios.md
# Copy this file to features/ and implement step definitions

@feature-{name}
Feature: {Feature Name}
  As a {role}
  I want {capability}
  So that {benefit}

  Background:
    Given I am on the {page} page

  # === US-1: {Story Title} ===

  @story-US-1 @happy-path
  Scenario: {Scenario 1.1 title}
    Given I enter "{email}" as email
    And I enter "{password}" as password
    When I click "{button}"
    Then I should be redirected to "{page}"
    And I should see my name

  @story-US-1 @error
  Scenario: {Scenario 1.2 title}
    Given I enter "{email}" as email
    And I enter "wrongpass" as password
    When I click "{button}"
    Then I should see error message "{message}"
    And I should stay on the {page} page
