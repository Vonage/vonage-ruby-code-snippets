require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
VERIFY_NUMBER = ENV['VERIFY_NUMBER']
VERIFY_BRAND_NAME = ENV['VERIFY_BRAND_NAME']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.verify.request(
  number: VERIFY_NUMBER,
  brand: VERIFY_BRAND_NAME
)
