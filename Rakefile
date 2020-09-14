# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'
require_relative 'lib/life'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
end

task :run do
  Life.new_game 30, 30, 0.05
end

RuboCop::RakeTask.new

task default: :test
