# encoding: utf-8
# frozen_string_literal: true

# !/usr/bin/env rake

require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  desc 'spec task stub'
  task :spec do
    warn 'rspec is disabled'
  end
end
desc 'alias test task to spec'
task :test => :spec

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new do |task|
    task.options = ['-D'] # Display the name of the failing cops
  end
rescue LoadError
  desc 'rubocop task stub'
  task :rubocop do
    warn 'RuboCop is disabled'
  end
end

task default: %i[test rubocop]
