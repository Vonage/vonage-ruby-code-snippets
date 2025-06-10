require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
MESSENGER_SENDER_ID = ENV['MESSENGER_SENDER_ID']
MESSENGER_RECIPIENT_ID = ENV['MESSENGER_RECIPIENT_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.messenger(
  type: 'text',
  message: "This is a Facebook Messenger text message sent using the Vonage Messages API"
)

client.messaging.send(
  from: MESSENGER_SENDER_ID,
  to: MESSENGER_RECIPIENT_ID,
  **message
)
