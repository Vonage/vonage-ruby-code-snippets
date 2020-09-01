# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.secrets.create(secret: 'Th1s-I5-my_n3w-s3cr3t')
  puts 'Secret Created Successfully' if response.created_at
rescue StandardError => e
  puts e.message
end
