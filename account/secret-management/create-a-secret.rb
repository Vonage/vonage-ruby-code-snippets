# frozen_string_literal: true

require 'dotenv/load'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.secrets.create(secret: 'Th1s-I5-my_n3w-s3cr3t')
  puts 'Secret Created Successfully' if response.created_at
rescue StandardError => e
  puts e.message
end
