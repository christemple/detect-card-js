require "rake"
require 'cucumber/rake/task'
require "colorize"

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

desc "Start the application"
task :start do
  start_application
end

def start_application
  prompt_to_install_node         unless has_node_installed?
  prompt_to_install_coffeescript unless has_coffeescript_installed?

  stop_application if application_running

  wait_until do
    application_running
  end
end

def prompt_to_install_node
  puts "You gotta install Node first dude\n".red.on_light_white <<
       "https://github.com/joyent/node/wiki/Installation".underline.blue.on_light_white
  fail "Node not found"
end

def prompt_to_install_coffeescript
  puts "You gotta install CoffeeScript first dude\n".red.on_light_white <<
       "http://coffeescript.org/#installation".underline.blue.on_light_white
  fail "CoffeeScript not found"
end

def has_node_installed?
  not `which node`.empty?
end

def has_coffeescript_installed?
  not `which coffee`.empty?
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
