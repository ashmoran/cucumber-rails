require 'cucumber/rails/rvm'

namespace :rvm do
  desc 'Create gemsets'
  task :create_gemsets do
    Cucumber::Rails::Rvm.each do |rvm|
      rvm.create_gemsets
    end
  end

  desc 'Install gems into all gemsets'
  task :install_gems => :create_gemsets do
    Cucumber::Rails::Rvm.each do |rvm|
      rvm.install_gems
    end
  end

  desc "Install cucumber-rails into all RVM environments"
  task :install_cucumber_rails do
    Cucumber::Rails::Rvm.each do |rvm|
      rvm.rvm('-S rake install')
    end
  end
end