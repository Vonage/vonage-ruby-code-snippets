require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
MESSAGES_SANDBOX_URL= ENV['MESSAGES_SANDBOX_URL']
MESSAGES_SANDBOX_WHATSAPP_NUMBER = ENV['MESSAGES_SANDBOX_WHATSAPP_NUMBER']
MESSAGES_SANDBOX_ALLOW_LISTED_TO_NUMBER = ENV['MESSAGES_SANDBOX_ALLOW_LISTED_TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH),
  api_host: MESSAGES_SANDBOX_URL
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'text',
  message: "This is a WhatsApp Message text message sent using the Messages API via the Messages Sandbox"
)

client.messaging.send(
  from: MESSAGES_SANDBOX_WHATSAPP_NUMBER,
  to: MESSAGES_SANDBOX_ALLOW_LISTED_TO_NUMBER,
  **message
)
