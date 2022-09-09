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
  type: 'custom',
  message: {
    type: "template",
    template: {
      namespace: WHATSAPP_TEMPLATE_NAMESPACE,
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
              type: "location",
              location: {
                longitude: -122.425332,
                latitude: 37.758056,
                name: "Facebook HQ",
                address: "1 Hacker Way, Menlo Park, CA 94025"
              }
            }
          ]
        },
        {
          type: "body",
          parameters: [
            "Value 1",
            "Value 2",
            "Value 3"
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
