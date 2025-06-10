require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VERIFY_BRAND_NAME = ENV['VERIFY_BRAND_NAME']
VERIFY_NUMBER = ENV['VERIFY_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

client.verify2.start_verification(
  brand: VERIFY_BRAND_NAME,
  workflow: [
    {
      channel: 'voice',
      to: VERIFY_NUMBER
    }
  ]
)
