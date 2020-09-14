# frozen_string_literal: true

require 'rake/testtask'
require_relative 'lib/life'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/*_test.rb']
end

task :run do
  Life.new_game 30, 30, 0.05
end

task default: :test
