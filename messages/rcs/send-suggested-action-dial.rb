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
  type: 'custom',
  message: {
    contentMessage: {
      text: "Call us to claim your free gift!",
      suggestions: [
        {
          action: {
            text: "Call now!",
            postbackData: "postback_data_1234",
            fallbackUrl: "https://www.example.com/contact/",
            dialAction: {
              phoneNumber: "+447900000000"
            }
          }
        }
      ]
    }
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
