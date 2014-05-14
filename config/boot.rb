# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

if File.exist?('.env') #Beyond local, '.env' wont' exist
  env_lines = File.read(".env").split("\n")
  env_lines.each do |line|
    key, value = line.split("=")
    ENV[key] ||= value
  end
end
