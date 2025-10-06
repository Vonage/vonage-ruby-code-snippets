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
  message: "Need some help? Call us now or visit our website for more information.",
  opts: {
    suggestions: [
      {
        type: "dial",
        text: "Call us",
        postback_data: "postback_data_1234",
        phone_number: "+447900000000",
        fallback_url: "https://www.example.com/contact/"
      },
      {
        type: "open_url",
        text: "Visit site",
        postback_data: "postback_data_1234",
        url: "https://www.example.com/",
        description: "A URL for the Example website"
      }
    ]
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
