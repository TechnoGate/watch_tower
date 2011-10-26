# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "watch_tower/version"
require 'rbconfig'

Gem::Specification.new do |s|
  s.name        = "watch_tower"
  s.version     = WatchTower.version
  s.authors     = ["Wael Nasreddine"]
  s.email       = ["wael.nasreddine@gmail.com"]
  s.homepage    = "https://github.com/TechnoGate/watch_tower"
  s.summary     = <<-MSG
WatchTower helps you track how much time you spend on all of your projects, at
the project, directory, and file level.
MSG
  s.description = <<-MSG
Did you ever want to keep track of how much time you _really_ spend on all of
your projects? Sure, you can try to remember to keep running estimates of your
time in the hope that you can aggregate those estimates later into some
meaningful data. But sometimes you forget, or an error creeps into your
estimate. And those errors add up. Quickly.

You can try some tracking software that depends on you to start and stop
timers. But what happens if you forget to start or stop one of those timers?

What you need is a passive system that will take care of all of this for you,
so you can focus on the actual work, which is where WatchTower comes into
play.

WatchTower runs in the background and keeps track of the time spent editing
each file with one of the supported editors (listed below). Since WatchTower
keeps track of the time spent on each file, and it knows which project each
file belongs to, you can view details and statistics on each project, right
down to the file level.
MSG

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")

  ####
  # Run-time dependencies
  ####

  # Appscript
  s.add_dependency 'rb-appscript', '~>0.6.1' if RbConfig::CONFIG['target_os'] =~ /darwin/i

  # Active Support
  s.add_dependency 'activesupport', '~>3.1.1'
  s.add_dependency 'i18n', '~>0.6.0'

  # Active Record
  s.add_dependency 'activerecord', '~>3.1.1'

  # Sinatra
  s.add_dependency 'sinatra', '~> 1.3.0'
  s.add_dependency 'sinatra-snap', '~>0.3.2'
  s.add_dependency 'haml', '~>3.1.3'

  # Git
  s.add_dependency 'grit', '~>2.4.1'

  # Asset Pipeline
  s.add_dependency 'coffee-script', '~>2.2.0'
  s.add_dependency 'uglifier', '~>1.0.3'
  s.add_dependency 'sass', '~>3.1.10'
  s.add_dependency 'sprockets', '~>2.0.2'

  # System commands
  s.add_dependency 'systemu', '~>2.4.0'

  # Crontab editor
  s.add_dependency 'cronedit', '~>0.3.0' if RbConfig::CONFIG['target_os'] =~ /linux/i

  ####
  # Development dependencies
  ####

  # Guard
  s.add_development_dependency 'guard', '~>0.8.4'
  s.add_development_dependency 'guard-bundler', '~>0.1.3'
  s.add_development_dependency 'guard-rspec', '~>0.4.5'
  s.add_development_dependency 'guard-sprockets2', '~>0.0.5'

  # Documentation
  s.add_development_dependency 'yard', '~>0.7.2'

  ####
  # Development / Test dependencies
  ####

  # RSpec / Capybara
  s.add_development_dependency 'rspec', '~>2.6.0'
  s.add_development_dependency 'rspec-rails', '~>2.6.1'
  s.add_development_dependency 'capybara', '~>1.1.1'
  s.add_development_dependency 'launchy', '~>2.0.5'

  # Mocha
  s.add_development_dependency 'mocha', '~>0.10.0'

  # Factory Girl
  s.add_development_dependency 'factory_girl', '~>2.1.2'

  # Timecop
  s.add_development_dependency 'timecop', '~>0.3.5'

  ####
  # Debugging
  ####
  s.add_development_dependency 'pry', '~>0.9.6.2'
end
