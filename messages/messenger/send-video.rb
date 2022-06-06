require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_FB_SENDER_ID = ENV['VONAGE_FB_SENDER_ID']
FB_RECIPIENT_ID = ENV['FB_RECIPIENT_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.messenger(
  type: 'video',
  message: {
    url: "https://example.com/video.mp4"
  }
)

client.messaging.send(
  from: VONAGE_FB_SENDER_ID,
  to: FB_RECIPIENT_ID,
  **message
)
