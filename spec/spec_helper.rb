require 'rubygems'

# All our specs should require 'spec_helper' (this file)

# If RACK_ENV isn't set, set it to 'test'.  Sinatra defaults to development,
# so we have to override that unless we want to set RACK_ENV=test from the
# command line when we run rake spec.  That's tedious, so do it here.
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rack/test'

module SinatraHelper
  def app
    Sinatra::Application
  end
end

module NokogiriHelper
  def parsed_body
    Nokogiri::HTML(last_response.body)
  end
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include SinatraHelper
  conf.include NokogiriHelper
end

