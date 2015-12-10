# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.logger = Le.new(Rails.application.secrets.logentries_key, :debug => true, :local => true)
