require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
TO_NUMBER = ENV['TO_NUMBER']
IMAGE_URL = ENV['IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
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
                fileUrl: ENV['IMAGE_URL'],
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
  to: TO_NUMBER,
  **message
)
