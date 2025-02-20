require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
WHATSAPP_SENDER_ID = ENV['WHATSAPP_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
WHATSAPP_TEMPLATE_NAME = ENV['WHATSAPP_TEMPLATE_NAME']
MESSAGES_IMAGE_URL = ENV['MESSAGES_IMAGE_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.whatsapp(
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
                link: MESSAGES_IMAGE_URL
              }
            }
          ]
        },
        {
          type: "body",
          parameters: [
            {
              type: "text",
              parameter_name: "customer_name",
              text: "Joe Bloggs"
            },
            {
              type: "text",
              parameter_name: "dentist_name",
              text: "Mr Smith"
            },
            {
              type: "text",
              parameter_name: "appointment_date",
              text: "2025-02-26"
            },
            {
              type: "text",
              parameter_name: "appointment_location",
              text: "ACME Dental Practice"
            }
          ]
        },
        {
          type: "button",
          sub_type: "quick_reply",
          index: "0",
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
          index: "1",
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
  from: WHATSAPP_SENDER_ID,
  to: MESSAGES_TO_NUMBER,
  **message
)

