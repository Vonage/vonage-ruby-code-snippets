require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
SEARCH_NUMBER = ENV['SEARCH_NUMBER']

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

insight = client.number_insight.standard(
  number: SEARCH_NUMBER
)

puts insight.inspect

