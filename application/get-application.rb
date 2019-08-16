# frozen_string_literal: true

require 'dotenv/load'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.applications_v2.get(NEXMO_APPLICATION_ID)
  puts "#{response.name}: #{response.id}"
rescue StandardError => e
  puts e.message
end
