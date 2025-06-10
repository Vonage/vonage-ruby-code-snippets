require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
WHATSAPP_SENDER_ID = ENV['WHATSAPP_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']
WHATSAPP_TEMPLATE_NAME = ENV['WHATSAPP_TEMPLATE_NAME']
WHATSAPP_OTP = ENV['WHATSAPP_OTP']

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
          type: "body",
          parameters: [
            {
              type: "text",
              text: WHATSAPP_OTP
            }
          ]
        },
        {
          type: "button",
          sub_type: "url",
          index: "0",
          parameters: [
            {
              type: "text",
              text: WHATSAPP_OTP
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
