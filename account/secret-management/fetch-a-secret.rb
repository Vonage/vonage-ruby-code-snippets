# frozen_string_literal: true

require 'dotenv'

Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

NEXMO_SECRET_ID = ENV['NEXMO_SECRET_ID']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)
result = client.secrets.get(NEXMO_SECRET_ID)

puts "ID: #{result.id} created on #{result.created_at}"
