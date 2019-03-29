require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.after(:suite) do
    puts "\e[36mCheckpoint:\e[5m \e[35m<< Clearing Test database >>\e[3m \e[37m#{config}\e[0m"
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE chitterdatabase;")

    # puts
    # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
  end

  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  Capybara.app = ChitterController
end
