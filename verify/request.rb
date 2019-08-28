require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
TO_NUMBER = ENV['TO_NUMBER']

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

response = client.verify.request(
  number: TO_NUMBER,
  brand: 'AcmeInc'
)

if response.status == '0'
  # display the Verify `request_id`
  puts response.request_id
else
  puts response.error_text
end
