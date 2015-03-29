ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.fuubar_progress_bar_options = { :format => 'Whiteboard: <%B> %p%% %a' }

  # used for testing mailers
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

  # included test helpers
  config.include AuthenticationHelper
end
