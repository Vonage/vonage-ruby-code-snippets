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
  type: 'custom',
  message: {
    contentMessage: {
      richCard: {
        standaloneCard: {
          thumbnailImageAlignment: "RIGHT",
          cardOrientation: "VERTICAL",
          cardContent: {
            title: "Quick question",
            description: "Do you like this picture?",
            media: {
              height: "TALL",
              contentInfo: {
                fileUrl: MESSAGES_IMAGE_URL,
                forceRefresh: false
              }
            },
            suggestions: [
              {
                reply: {
                  text: "Yes",
                  postbackData: "suggestion_1"
                }
              },
              {
                reply: {
                  text: "I love it!",
                  postbackData: "suggestion_2"
                }
              }
            ]
          }
        }
      }
    }
  }
)

client.messaging.send(
  from: RCS_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
