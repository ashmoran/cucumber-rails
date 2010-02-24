Feature: Walking skeleton Rails 2
  In order to ensure Cucumber is working
  As a Rails developer
  I want the `cucumber` command to work out of the box

  Scenario: Running cucumber after running the generator and `gem install database_cleaner`
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails 2 app "rails-2-app"
    And I run "script/generate cucumber" in the app
    When I run "cucumber" in the app
    Then the command should succeed
    And I should see "0 scenarios"
    And I should see "0 steps"
