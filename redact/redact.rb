# frozen_string_literal: true

require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
NEXMO_REDACT_ID = ENV['NEXMO_REDACT_ID']

NEXMO_REDACT_TYPE = ARGV[0]
if NEXMO_REDACT_TYPE.empty?
  puts 'Please supply the product type'
  exit
end

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

client.redact.transaction(
  id: NEXMO_REDACT_ID,
  product: NEXMO_REDACT_TYPE
)
