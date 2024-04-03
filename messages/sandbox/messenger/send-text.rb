require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
MESSAGES_SANDBOX_URL= ENV['MESSAGES_SANDBOX_URL']
MESSAGES_SANDBOX_FB_ID = ENV['MESSAGES_SANDBOX_FB_ID']
MESSAGES_SANDBOX_ALLOW_LISTED_FB_RECIPIENT_ID = ENV['MESSAGES_SANDBOX_ALLOW_LISTED_FB_RECIPIENT_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH),
  api_host: MESSAGES_SANDBOX_URL
)

message = Vonage::Messaging::Message.messenger(
  type: 'text',
  message: "This is a Facebook Messenger text message sent using the Messages API via the Messages Sandbox"
)

client.messaging.send(
  from: MESSAGES_SANDBOX_FB_ID,
  to: MESSAGES_SANDBOX_ALLOW_LISTED_FB_RECIPIENT_ID,
  **message
)
