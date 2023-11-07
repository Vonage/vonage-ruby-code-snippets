require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_WHATSAPP_NUMBER = ENV['VONAGE_WHATSAPP_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']
WHATSAPP_TEMPLATE_NAME = ENV['WHATSAPP_TEMPLATE_NAME']
IMAGE_URL = ENV['IMAGE_URL']
WHATSAPP_TEMPLATE_REPLACEMENT_TEXT = ENV['WHATSAPP_TEMPLATE_REPLACEMENT_TEXT']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'custom',
  message: {
    type: "template",
    template: {
      name: WHATSAPP_TEMPLATE_NAME,
      language: {
        policy: "deterministic",
        code: "en"
      },
      components: [
        {
          type: "header",
          parameters: [
            {
              type: "image",
              image: {
                link: IMAGE_URL
              }
            }
          ]
        },
        {
          type: "body",
          parameters: [
            {
              type: "text",
              text: WHATSAPP_TEMPLATE_REPLACEMENT_TEXT
            }
          ]
        }
      ]
    }
  }
)

client.messaging.send(
  from: VONAGE_WHATSAPP_NUMBER,
  to: TO_NUMBER,
  **message
)
