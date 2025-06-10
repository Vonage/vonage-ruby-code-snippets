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
      text: "Need some help? Call us now or visit our website for more information.",
      suggestions: [
        {
          action: {
            text: "Call us",
            postbackData: "postback_data_1234",
            fallbackUrl: "https://www.example.com/contact/",
            dialAction: {
              phoneNumber: "+447900000000"
            }
          }
        },
        {
          action: {
            text: "Visit site",
            postbackData: "postback_data_1234",
            openUrlAction: {
              url: "http://example.com/"
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
