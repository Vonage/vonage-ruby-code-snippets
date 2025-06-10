require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VIBER_SENDER_ID = ENV['VIBER_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.viber(
  type: 'image',
  message: {
    url: MESSAGES_IMAGE_URL
  }
)

client.messaging.send(
  from: VIBER_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
