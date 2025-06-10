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
      text: "Product Launch: Save the date!",
      suggestions: [
        {
          action: {
            text: "Save to calendar",
            postbackData: "postback_data_1234",
            fallbackUrl: "https://www.google.com/calendar",
            createCalendarEventAction: {
              startTime: "2024-08-24T20:00:00Z",
              endTime: "2024-08-24T22:00:00Z",
              title: "Vonage API Product Launch",
              description: "Event to demo a new and exciting Vonage API product"
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
