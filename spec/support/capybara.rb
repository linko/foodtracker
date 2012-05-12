require 'capybara/rails'
require 'capybara/rspec'

CAPYBARA_PORT = 22001

Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 5
Capybara.server_port = CAPYBARA_PORT
