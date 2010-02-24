require 'cucumber/rails/rvm'

Given /^I'm using Ruby (.*) and Rails (.*)$/ do |ruby_name, rails_version|
  @rvm = Cucumber::Rails::Rvm.new(ruby_name, rails_version, nil, self)
end

Given /^a Rails app "(.*)"$/ do |app_name|
  @rails_app = @rvm.new_rails_app(app_name)
end

When /^I run "([^\"]*)" in the app$/ do |command|
  @last_command_output = @rails_app.run(command)
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

Then /^I should see "([^\"]*)"$/ do |expected_text|
  @last_command_output.stdout.should include(expected_text)
end

Then /^I should see "([^\"]*)" in STDERR$/ do |expected_text|
  @last_command_output.stderr.should include(expected_text)
end

Then /^the command should fail$/ do
  @last_command_output.exit_status.should == 1
end

Then /^the command should succeed$/ do
  @last_command_output.exit_status.should == 0
end
