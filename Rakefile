require "rake/testtask"

APP_PATH = "lib/bottles.rb"

task :default => :test

desc "Say hello"
task :hello do
  puts "hello world"
end

desc 'Run tests'
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :app do
  sh "ruby #{APP_PATH}"
end

task :rubocop do
  sh "rubocop #{APP_PATH} -d"
end
