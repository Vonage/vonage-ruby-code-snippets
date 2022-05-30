require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
VONAGE_FROM_NUMBER = ENV['VONAGE_FROM_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
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
