# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
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