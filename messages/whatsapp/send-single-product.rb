require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_WHATSAPP_NUMBER = ENV['VONAGE_WHATSAPP_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']
CATALOG_ID = ENV['CATALOG_ID']
PRODUCT_ID = ENV['PRODUCT_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'custom',
  message: {
    type: "interactive",
    interactive: {
      type: "product",
      body: {
        text: "Check out this cool product"
      },
      footer: {
        text: "Sale now on!"
      },
      action: {
        catalog_id: CATALOG_ID,
        product_retailer_id: PRODUCT_ID
      }
    }
  }
)

client.messaging.send(
  from: VONAGE_WHATSAPP_NUMBER,
  to: TO_NUMBER,
  **message
)
