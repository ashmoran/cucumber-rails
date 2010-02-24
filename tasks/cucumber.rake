require 'cucumber/rails/rvm'

desc "Prepare and run the features"
task :cucumber => %w[ rvm:install_cucumber_rails cucumber:run ]

namespace :cucumber do
  desc "Run the Cucumber features without preparing RVM"
  task :run do
    system "cucumber --tags ~@wip"
  end
end
