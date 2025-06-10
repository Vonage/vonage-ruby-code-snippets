# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.secrets.list
