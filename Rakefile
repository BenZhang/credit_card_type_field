require 'rubygems'
require 'rake'

begin
  require 'rspec/core/rake_task'
  desc "Run RSpec"
  RSpec::Core::RakeTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  puts "You should run rake spec:install in order to install all corresponding gems!"
end

task :default => :spec

namespace :db do
  desc 'Prepare sqlite database'
  task :migrate do
    system 'cd spec/dummy && rake db:migrate RAILS_ENV=test && rake db:migrate RAILS_ENV=development'
  end
end