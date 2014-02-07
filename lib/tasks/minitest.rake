require 'rake/testtask'

task default: 'test'

Rake::TestTask.new(test: 'db:test:prepare') do |t|
        t.libs << 'test'
        t.pattern = 'test/**/*_test.rb'
end
