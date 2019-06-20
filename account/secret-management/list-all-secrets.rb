require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

require 'nexmo'

client = Nexmo::Client.new(
    api_key: NEXMO_API_KEY,
    api_secret: NEXMO_API_SECRET
)

result = client.secrets.list
formatted_result = result.to_h[:_embedded].to_h[:secrets].to_a[0].to_h

puts "ID: #{formatted_result[:id]} created on #{formatted_result[:created_at]}"