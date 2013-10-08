Dir["#{File.expand_path(File.dirname(__FILE__))}/support/**/*.rb"].each { |f| require f }
require 'calabash-cucumber'
require 'debugger'

RSpec.configure do |c|
  c.include WickedGoodHelpers
  c.include Calabash::Cucumber::Operations
end
