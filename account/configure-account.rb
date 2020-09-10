require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

SMS_CALLBACK_URL = ENV['SMS_CALLBACK_URL']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

result = client.account.update(
  moHttpUrl: SMS_CALLBACK_URL
)

result.to_h.each do |key, value|
  puts "#{key}: #{value}"
end
