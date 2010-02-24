require 'cucumber/rails/rvm'

Given /^I'm using Ruby (.*) and Rails (.*)$/ do |ruby_name, rails_version|
  @rvm = Cucumber::Rails::Rvm.new(ruby_name, rails_version, nil, self)
end

Given /^a Rails app "(.*)"$/ do |app_name|
  @rails_app = @rvm.new_rails_app(app_name)
end

When /^I run "([^\"]*)" in the app$/ do |command|
  @rails_app.run(command)

  # FIX are your eyes bleeding yet? :)
  # Aslak plans to remove Rvm from cucumber-rails so this is just a temporary hack
  @last_stdout      = @rvm.instance_variable_get("@last_stdout")
  @last_exit_status = @rvm.instance_variable_get("@last_exit_status")
  @last_stderr      = @rvm.instance_variable_get("@last_stderr")
end

Then /^I get the following new files and directories$/ do |files|
  expected_files = files.hashes.collect { |row| row[:name] }
  @rails_app.should have_files(expected_files)
end

Then /^the files are configured for (?:.*)$/ do |files|
  files.hashes.each do |file|
    @rails_app.file(file[:name]).should have_contents(file[:contents])
  end
end
