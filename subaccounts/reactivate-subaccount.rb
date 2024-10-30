require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
SUBACCOUNT_KEY = ENV['SUBACCOUNT_KEY']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.subaccounts.update(
  subaccount_key: SUBACCOUNT_KEY,
  suspended: false
)
