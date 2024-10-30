require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
SUBACCOUNT_KEY = ENV['SUBACCOUNT_KEY']
VONAGE_NUMBER = ENV['VONAGE_NUMBER']
COUNTRY = ENV['COUNTRY']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.subaccounts.transfer_number(
  from: VONAGE_API_KEY,
  to: SUBACCOUNT_KEY,
  number: VONAGE_NUMBER,
  country: COUNTRY
)
