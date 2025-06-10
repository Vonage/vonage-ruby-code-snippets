require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
SMS_SENDER_ID = ENV['SMS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.sms(
  message: "A SMS message sent using the Vonage Messages API"
)

client.messaging.send(
  from: SMS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
