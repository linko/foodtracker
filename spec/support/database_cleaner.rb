RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = if Capybara.current_driver != :rack_test
      :truncation
    else
      :transaction
    end

    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
