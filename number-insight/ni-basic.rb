require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
INSIGHT_NUMBER = ENV['INSIGHT_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

insight = client.number_insight.basic(
  number: INSIGHT_NUMBER
)

puts insight.inspect

