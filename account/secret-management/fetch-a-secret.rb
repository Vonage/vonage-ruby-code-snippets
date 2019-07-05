require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

NEXMO_SECRET_ID = ENV['NEXMO_SECRET_ID']

require 'nexmo'

client = Nexmo::Client.new(
    api_key: NEXMO_API_KEY,
    api_secret: NEXMO_API_SECRET
)

result = client.secrets.get(NEXMO_SECRET_ID)
result_hash = result._embedded.secrets[0].to_h

puts "ID: #{result_hash[:id]} created on #{result_hash[:created_at]}"