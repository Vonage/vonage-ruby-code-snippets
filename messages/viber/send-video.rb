require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VIBER_SENDER_ID = ENV['VIBER_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
MESSAGES_VIDEO_URL = ENV['MESSAGES_VIDEO_URL']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']
MESSAGES_VIDEO_DURATION = ENV['MESSAGES_VIDEO_DURATION']
MESSAGES_VIDEO_FILE_SIZE = ENV['MESSAGES_VIDEO_FILE_SIZE']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.viber(
  type: 'video',
  message: {
    url: MESSAGES_VIDEO_URL,
    thumb_url: MESSAGES_IMAGE_URL
  },
  opts: {
    viber_service: {
      duration: MESSAGES_VIDEO_DURATION,
      file_size: MESSAGES_VIDEO_FILE_SIZE
    }
  }
)

client.messaging.send(
  from: VIBER_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)
