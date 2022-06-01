require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_FROM_NUMBER = ENV['VONAGE_FROM_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.mms(
  type: 'image',
  message: {
    url: "https://example.com/image.jpg",
    caption: "A MMS image message, with caption, sent using the Vonage Messages API"
  }
)

client.messaging.send(
  from: VONAGE_FROM_NUMBER,
  to: TO_NUMBER,
  **message
)
