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

  fail "Failed to start node server" unless system "coffee -c lib/detect-card.coffee server.coffee | node server.js"
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