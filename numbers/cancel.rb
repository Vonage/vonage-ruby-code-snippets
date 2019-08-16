require 'dotenv/load'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
NEXMO_NUMBER = ENV['NEXMO_NUMBER']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.numbers.cancel(
    country: COUNTRY_CODE,
    msisdn: NEXMO_NUMBER
  )
  puts "Number cancelled"
rescue
  puts "Error cancelling number"
end