# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

VONAGE_SECRET_ID = ENV['VONAGE_SECRET_ID']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)
result = client.secrets.get(VONAGE_SECRET_ID)

puts "ID: #{result.id} created on #{result.created_at}"
