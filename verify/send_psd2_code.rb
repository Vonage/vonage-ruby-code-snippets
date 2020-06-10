# frozen_string_literal: true

require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
TO_NUMBER = ENV['TO_NUMBER']

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

response = client.verify.psd2(
  number: TO_NUMBER,
  payee: 'AcmeInc',
  amount: 12.34
)

if response
  # display the Verify PSD2 `request_id`
  puts response.request_id
end