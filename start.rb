Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }

if ENV['APP_ENVIRONMENT_NAME'].eql?('development')
  require 'byebug'
end

puts Application.new.run
