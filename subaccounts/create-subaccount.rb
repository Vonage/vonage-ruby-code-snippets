require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
NEW_SUBACCOUNT_NAME = ENV['NEW_SUBACCOUNT_NAME']
NEW_SUBACCOUNT_SECRET = ENV['NEW_SUBACCOUNT_SECRET']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.subaccounts.create(
  name: NEW_SUBACCOUNT_NAME,
  secret: NEW_SUBACCOUNT_SECRET
)
