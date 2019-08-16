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
  response = client.numbers.buy(
    country: COUNTRY_CODE,
    msisdn: NEXMO_NUMBER
  )
  puts "Number purchased"
rescue
  puts "Error purchasing number"
end