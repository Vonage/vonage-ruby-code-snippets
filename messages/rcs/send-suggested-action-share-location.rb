require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = client.messaging.rcs(
  type: 'custom',
  message: {
    contentMessage: {
      text: "Your driver will come and meet you at your specified location.",
      suggestions: [
        {
          action: {
            text: "Share a location",
            postbackData: "postback_data_1234",
            shareLocationAction: {}
          }
        }
      ]
    }
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: TO_NUMBER,
  **message
)
