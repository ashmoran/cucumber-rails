$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'fileutils'
require 'rubygems'
require 'spec'

begin
  require 'aruba/cucumber'
rescue LoadError => ignore
  STDOUT.puts "The aruba gem is not installed. That's ok."
end

Before do
  FileUtils.rm_rf("tmp") if File.directory?("tmp")
  Dir.mkdir("tmp")
end