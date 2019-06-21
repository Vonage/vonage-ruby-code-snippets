require 'dotenv'
Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

SMS_CALLBACK_URL = ENV['SMS_CALLBACK_URL']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

result = client.account.update(
    moHttpUrl: SMS_CALLBACK_URL
)

result.to_h.each do |key, value|
    puts "#{key}: #{value}"
end