require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
SMS_SENDER_ID = ENV['SMS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET,
  authentication_preference: :basic
)

message = client.messaging.sms(
  message: "A SMS message sent using the Vonage Messages API"
)

client.messaging.send(
  from: SMS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
