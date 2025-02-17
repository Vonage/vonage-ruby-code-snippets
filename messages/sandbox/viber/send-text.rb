require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VIBER_SENDER_ID = ENV['VIBER_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_SANDBOX_HOST = ENV['MESSAGES_SANDBOX_HOST']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY,
  api_host: MESSAGES_SANDBOX_HOST
)

message = client.messaging.viber(
  type: 'text',
  message: "This is a Viber Business Service text message sent using the Vonage Messages API"
)

client.messaging.send(
  from: VIBER_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
