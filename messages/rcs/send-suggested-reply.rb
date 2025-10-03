require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.rcs(
  type: 'text',
  message: "What do you think of Vonage APIs?",
  opts: {
    suggestions: [
      {
        type: "reply",
        text: "Great!",
        postback_data: "suggestion_1"
      },
      {
        type: "reply",
        text: "Awesome!",
        postback_data: "suggestion_2"
      }
    ]
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
