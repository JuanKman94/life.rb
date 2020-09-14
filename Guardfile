# frozen_string_literal: true

group :red_green_refactor, halt_on_fail: true do
  guard :minitest do
    watch(%r{^test/(.*)\/?(.*)_test\.rb$})
    watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "test/#{m[1]}test_#{m[2]}.rb" }
    watch(%r{^test/test_helper\.rb$})  { 'test' }
  end

  # if the repo grows too much, consider passing `all_on_start: false`
  guard :rubocop do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end

# vim: ft=ruby
