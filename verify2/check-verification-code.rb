require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VERIFY_REQUEST_ID = ENV['VERIFY_REQUEST_ID']
VERIFY_CODE = ENV['VERIFY_CODE']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

client.verify2.check_code(
  request_id: VERIFY_REQUEST_ID,
  code: VERIFY_CODE
)
