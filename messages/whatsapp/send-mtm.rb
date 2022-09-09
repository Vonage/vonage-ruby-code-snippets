require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_WHATSAPP_NUMBER = ENV['VONAGE_WHATSAPP_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']
WHATSAPP_TEMPLATE_NAMESPACE = ENV['WHATSAPP_TEMPLATE_NAMESPACE']
WHATSAPP_TEMPLATE_NAME = ENV['WHATSAPP_TEMPLATE_NAME']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'template',
  message: {
    name: "#{WHATSAPP_TEMPLATE_NAMESPACE}:#{WHATSAPP_TEMPLATE_NAME}",
    parameters: [
       "Vonage Verification",
       "64873",
       "10"
    ]
  },
  opts: {
    whatsapp: {
     policy: "deterministic",
     locale: "en-GB"
   }
  }
)

client.messaging.send(
  from: VONAGE_WHATSAPP_NUMBER,
  to: TO_NUMBER,
  **message
)
