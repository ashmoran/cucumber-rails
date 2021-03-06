Feature: Rails 2 script/generate cucumber
  In order to quickly set up Cucumber
  As a Rails developer
  I want to have the Cucumber skeleton generated automatically

  Scenario: Rails 2
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails app "rails-2-app"
    When I run "script/generate cucumber" in the app
    Then I get the following new files and directories
      | name                                   |
      | config/cucumber.yml                    |
      | config/environments/cucumber.rb        |
      | script/cucumber                        |
      | features/step_definitions              |
      | features/step_definitions/web_steps.rb |
      | features/support                       |
      | features/support/env.rb                |
      | features/support/paths.rb              |
      | lib/tasks                              |
      | lib/tasks/cucumber.rake                |

  Scenario: Rails 2 with Webrat
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails app "rails-2-app"
    When I run "script/generate cucumber --webrat" in the app
    Then the files are configured for Webrat
      | name                            | contents                       |
      | config/environments/cucumber.rb | config.gem 'webrat'            |
      | features/support/env.rb         | require 'webrat'               |
      | features/support/env.rb         | require 'webrat/core/matchers' |

  Scenario: Rails 2 with Capybara
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails app "rails-2-app"
    When I run "script/generate cucumber --capybara" in the app
    Then the files are configured for Capybara
      | name                            | contents                                               |
      | config/environments/cucumber.rb | config.gem 'capybara'                                  |
      | features/support/env.rb         | require 'capybara/rails'                               |
      | features/support/env.rb         | require 'capybara/cucumber'                            |
      | features/support/env.rb         | require 'capybara/session'                             |
      | features/support/env.rb         | require 'cucumber/rails/capybara_javascript_emulation' |

  # I can't actually find any identifying behaviour here -
  # maybe spec that it doesn't have RSpec references?
  # or add something into the generator?
  Scenario: Rails 2 with Test::Unit
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails app "rails-2-app"
    When I run "script/generate cucumber --testunit" in the app
    Then the files are configured for Capybara
      | name | contents |

  Scenario: Rails 2 with Test::Unit
    Given I'm using Ruby 1.8.7 and Rails 2.3.5
    And a Rails app "rails-2-app"
    When I run "script/generate cucumber --rspec" in the app
    Then the files are configured for Capybara
      | name                            | contents                       |
      | config/environments/cucumber.rb | config.gem 'rspec'             |
      | config/environments/cucumber.rb | config.gem 'rspec-rails'       |
      | features/support/env.rb         | require 'cucumber/rails/rspec' |
