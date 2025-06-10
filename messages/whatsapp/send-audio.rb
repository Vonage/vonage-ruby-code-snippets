require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
WHATSAPP_SENDER_ID = ENV['WHATSAPP_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_AUDIO_URL = ENV['MESSAGES_AUDIO_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.whatsapp(
  type: 'audio',
  message: {
    url: MESSAGES_AUDIO_URL
  }
)

client.messaging.send(
  from: WHATSAPP_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)

