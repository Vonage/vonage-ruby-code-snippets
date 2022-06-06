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
        code: "en",
        policy: "deterministic"
      },
      components: [
        {
          type: "header",
          parameters: [
            {
              type: "text",
              text: "12/26"
            }
          ]
        },
        {
          type: "body",
          parameters: [
            {
              type: "text",
              text: "*Ski Trip*"
            },
            {
              type: "text",
              text: "2019-12-26"
            },
            {
              type: "text",
              text: "*Squaw Valley Ski Resort, Tahoe*"
            }
          ]
        },
        {
          type: "button",
          sub_type: "quick_reply",
          index: 0,
          parameters: [
            {
              type: "payload",
              payload: "Yes-Button-Payload"
            }
          ]
        },
        {
          type: "button",
          sub_type: "quick_reply",
          index: 1,
          parameters: [
            {
              type: "payload",
              payload: "No-Button-Payload"
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
