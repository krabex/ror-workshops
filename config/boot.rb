ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['APP_NAME'] ||= 'RoR Workshops'

require 'bundler/setup' # Set up gems listed in the Gemfile.
