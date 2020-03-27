require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

REQUEST_ID = ARGV[0]
if REQUEST_ID.empty?
  puts 'Please supply the `request_id'
  exit
end

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

response = client.verify.trigger_next_event(REQUEST_ID)

if response
  puts response.error_text
end
