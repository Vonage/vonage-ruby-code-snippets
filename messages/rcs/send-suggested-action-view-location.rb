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
  message: "Drop by our office!",
  opts: {
    suggestions: [
      {
        type: "view_location",
        text: "View map",
        postback_data: "postback_data_1234",
        latitude: 51.5230371,
        longitude: -0.0852492,
        pin_label: "Vonage London Office",
        fallback_url: "https://www.google.com/maps/place/Vonage/@51.5230371,-0.0852492,15z"
      }
    ]
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
