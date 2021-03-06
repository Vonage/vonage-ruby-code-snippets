# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.applications.delete(VONAGE_APPLICATION_ID)
  puts 'OK' if response == :no_content
rescue StandardError => e
  puts e.message
end
