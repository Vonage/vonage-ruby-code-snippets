require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.rcs(
  type: 'card',
  message: {
    title: "Quick question",
    text: "Do you like this picture?",
    media_url: MESSAGES_IMAGE_URL,
    media_height: "SHORT",
    media_description: "Picture of a cat",
    thumbnail_url: MESSAGES_IMAGE_URL,
    media_force_refresh: false,
    suggestions: [
     {
        type: "reply",
        text: "Yes",
        postback_data: "suggestion_1"
      },
      {
        type: "reply",
        text: "I love it!",
        postback_data: "suggestion_2"
      }
    ]
  },
  opts: {
    rcs: {
      card_orientation: "HORIZONTAL",
      image_alignment: "RIGHT"
    }
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
