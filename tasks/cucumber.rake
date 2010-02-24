require 'cucumber/rails/rvm'

desc "Prepare and run the features"
task :cucumber => %w[ cucumber:prepare cucumber:run ]

namespace :cucumber do
  desc "Run the Cucumber features without preparing RVM"
  task :run do
    system "cucumber --tags ~@wip"
  end
  
  # TODO a task for this
  # 1.9.1 / Rails 3
  # cd rails/rails3
  # gem install sqlite3
  # rails rails3 --skip-testunit
  #
  # # 1.8.7 / Rails 2
  # gem install rails capybara cucumber cucumber-rails rspec rspec-rails
  # cd rails
  # rehash
  # rails rails2
  # script/generate cucumber --capybara
  # mv config/cucumber.yml ../rails3/config
  # mv features ../rails3

  # TODO document properly - this is the easiest way to get
  # local enviroments together for manual testing
  desc "Prepare RVM environments for Cucumber"
  task :prepare do
<<<<<<< HEAD
    system "rvm 1.9.1%cucumber-rails -S rake install"
    system "rvm 1.8.7%cucumber-rails -S rake install"
=======
    Cucumber::Rails::Rvm.each do |rvm|
      rvm.rvm('-S rake install')
    end
>>>>>>> 2bc67dd834b3897a1afaeb7bc2cb19840a612369
  end
end
