require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
MESSENGER_SENDER_ID = ENV['MESSENGER_SENDER_ID']
MESSENGER_RECIPIENT_ID = ENV['MESSENGER_RECIPIENT_ID']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.messenger(
  type: 'image',
  message: {
    url: MESSAGES_IMAGE_URL
  }
)

client.messaging.send(
  from: MESSENGER_SENDER_ID,
  to: MESSENGER_RECIPIENT_ID,
  **message
)
