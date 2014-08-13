# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "bio-faster"
  gem.homepage = "http://github.com/fstrozzi/bioruby-faster"
  gem.license = "MIT"
  gem.summary = %Q{A fast parser for FastQ files}
  gem.description = %Q{A fast parser for FastQ files}
  gem.email = "francesco.strozzi@gmail.com"
  gem.authors = ["Francesco Strozzi"]
  gem.files << "lib/*/**"
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

namespace :ext do
  desc "Build native extension"
  task :build do
    cd "ext"
    ruby "mkrf_conf.rb"
    sh "rake"
    cd ".."
  end

end

task :default => ["ext:build",:spec]
