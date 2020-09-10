# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

VONAGE_REDACT_ID = ARGV[0] || ''
if VONAGE_REDACT_ID.empty?
  puts 'Please supply the product ID'
  exit
end

VONAGE_REDACT_TYPE = ARGV[1] || ''
if VONAGE_REDACT_TYPE.empty?
  puts 'Please supply the product type'
  exit
end

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.redact.transaction(
  id: VONAGE_REDACT_ID,
  product: VONAGE_REDACT_TYPE
)
