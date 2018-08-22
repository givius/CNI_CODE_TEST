ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'rspec'

APP_ROOT = File.expand_path("#{__dir__}/..")
$: << "#{APP_ROOT}/app/"

require_relative '../app/news_test'

RSpec.configure do |config|
  config.color = true
  config.include Rack::Test::Methods
end