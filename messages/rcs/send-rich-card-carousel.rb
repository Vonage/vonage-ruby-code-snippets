require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']
MESSAGES_VIDEO_URL = ENV['MESSAGES_VIDEO_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.rcs(
  type: 'custom',
  message: {
    contentMessage: {
      richCard: {
        carouselCard: {
          cardWidth: "MEDIUM",
          cardContents: [
            {
              title: "Option 1: Photo",
              description: "Do you prefer this photo?",
              media: {
                height: "MEDIUM",
                contentInfo: {
                  fileUrl: MESSAGES_IMAGE_URL,
                  forceRefresh: false
                }
              },
              suggestions: [
                {
                  reply: {
                    text: "Option 1",
                    postbackData: "card_1"
                  }
                }
              ]
            },
            {
              title: "Option 1: Video",
              description: "Or this video?",
              media: {
                height: "MEDIUM",
                contentInfo: {
                  fileUrl: MESSAGES_VIDEO_URL,
                  forceRefresh: false
                }
              },
              suggestions: [
                {
                  reply: {
                    text: "Option 2",
                    postbackData: "card_2"
                  }
                }
              ]
            }
          ]
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
