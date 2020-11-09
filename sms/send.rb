require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
VONAGE_BRAND_NAME = ENV['VONAGE_BRAND_NAME']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.sms.send(
  from: VONAGE_BRAND_NAME,
  to: TO_NUMBER,
  text: 'A text message sent using the Vonage SMS API'
)
