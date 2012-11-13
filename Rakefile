require "rake"
require 'cucumber/rake/task'

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

desc "Start the application"
task :start do
  start_application
end

def start_application
  stop_application if application_running

  fail "Failed to start node server" unless system "coffee -c lib/detect-card.coffee server.coffee | node server.js &"
  wait_until do
    application_running
  end
end


def stop_application
  system "kill -9 #{application_process_id}"
end

def application_running
  not `lsof -i tcp:1337 | grep LISTEN`.empty?
end

def application_process_id
  `lsof -i tcp:1337 | grep LISTEN`.split[1]
end

def wait_until timeout=60
  start_time = Time.now
  until Time.now > start_time + timeout
    return if yield
    sleep 0.5
  end
  raise "action took too long"
end

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end
