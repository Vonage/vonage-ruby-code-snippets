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
      text: "Drop by our office!",
      suggestions: [
        {
          action: {
            text: "View map",
            postbackData: "postback_data_1234",
            fallbackUrl: "https://www.google.com/maps/place/Vonage/@51.5230371,-0.0852492,15z",
            viewLocationAction: {
              latLong: {
                latitude: 51.5230371,
                longitude: -0.0852492
              },
              label: "Vonage London Office"
            }
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
