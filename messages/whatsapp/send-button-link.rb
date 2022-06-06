require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_WHATSAPP_NUMBER = ENV['VONAGE_WHATSAPP_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']
WHATSAPP_TEMPLATE_NAMESPACE = ENV['WHATSAPP_TEMPLATE_NAMESPACE']
WHATSAPP_TEMPLATE_NAME = ENV['WHATSAPP_TEMPLATE_NAME']
HEADER_IMAGE_URL = ENV['HEADER_IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'custom',
  message: {
    type: "template",
    template: {
      namespace: WHATSAPP_TEMPLATE_NAMESPACE,
      name: WHATSAPP_TEMPLATE_NAME,
      language: {
        code: "en",
        policy: "deterministic"
      },
      components: [
        {
          type: "header",
          parameters: [
            {
              type: "image",
              image: {
                link: HEADER_IMAGE_URL
              }
            }
          ]
        },
        {
          type: "body",
          parameters: [
            {
              type: "text",
              text: "Anand"
            },
            {
              type: "text",
              text: "Quest"
            },
            {
              type: "text",
              text: "113-0921387"
            },
            {
              type: "text",
              text: "23rd Nov 2019"
            }
          ]
        },
        {
          type: "button",
          index: "0",
          sub_type: "url",
          parameters: [
            {
              type: "text",
              text: "1Z999AA10123456784"
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
