require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.verify.request(
  number: TO_NUMBER,
  brand: 'AcmeInc'
)

if response
  # display the Verify `request_id`
  puts response.request_id
end
