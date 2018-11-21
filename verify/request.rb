require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
NEXMO_TO_NUMBER = ENV['NEXMO_TO_NUMBER']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

response = client.verify.request(
  number: NEXMO_TO_NUMBER,
  brand: 'Acme Inc'
)

if response.status == '0'
  # display the Verify `request_id`
  puts response.request_id
else
  puts response.error_text
end
