require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
VONAGE_NUMBER = ENV['VONAGE_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.numbers.cancel(
    country: COUNTRY_CODE,
    msisdn: VONAGE_NUMBER
  )
  puts "Number cancelled"
rescue
  puts "Error cancelling number"
end