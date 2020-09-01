require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

REQUEST_ID = ARGV[0]
if REQUEST_ID.empty?
  puts 'Please supply the `request_id'
  exit
end

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.verify.search(request_id: REQUEST_ID)

if response
  # The current status of this request, for example:
  # => IN PROGRESS
  puts response.status
end
