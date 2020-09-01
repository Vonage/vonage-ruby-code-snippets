require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
SEARCH_NUMBER = ENV['SEARCH_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

insight = client.number_insight.standard(
  number: SEARCH_NUMBER
)

puts insight.inspect

