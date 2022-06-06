require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_VIBER_SERVICE_MESSAGE_ID = ENV['VONAGE_VIBER_SERVICE_MESSAGE_ID']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.viber(
  type: 'image',
  message: {
    url: "https://example.com/image.jpg"
  }
)

client.messaging.send(
  from: VONAGE_VIBER_SERVICE_MESSAGE_ID,
  to: TO_NUMBER,
  **message
)
