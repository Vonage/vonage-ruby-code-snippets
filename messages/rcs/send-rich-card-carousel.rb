require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
TO_NUMBER = ENV['TO_NUMBER']
IMAGE_URL = ENV['IMAGE_URL']
VIDEO_URL = ENV['VIDEO_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
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
                  fileUrl: ENV['IMAGE_URL'],
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
                  fileUrl: ENV['VIDEO_URL'],
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
  to: TO_NUMBER,
  **message
)
