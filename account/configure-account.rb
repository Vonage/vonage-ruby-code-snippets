require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
ACCOUNT_SMS_CALLBACK_URL = ENV['ACCOUNT_SMS_CALLBACK_URL']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.account.update(
  moHttpUrl: SMS_CALLBACK_URL
)
