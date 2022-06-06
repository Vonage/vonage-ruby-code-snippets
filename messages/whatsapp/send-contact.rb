require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
VONAGE_WHATSAPP_NUMBER = ENV['VONAGE_WHATSAPP_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

message = Vonage::Messaging::Message.whatsapp(
  type: 'custom',
  message: {
    type: "contacts",
    contacts: [
      {
        addresses: [
          {
            city: "Menlo Park",
            country: "United States",
            country_code: "us",
            state: "CA",
            street: "1 Hacker Way",
            type: "HOME",
            zip: "94025"
          },
          {
            city: "Menlo Park",
            country: "United States",
            country_code: "us",
            state: "CA",
            street: "200 Jefferson Dr",
            type: "WORK",
            zip: "94025"
          }
        ],
        birthday: "2012-08-18",
        emails: [
          {
            email: "test@fb.com",
            type: "WORK"
          },
          {
            email: "test@whatsapp.com",
            type: "WORK"
          }
        ],
        name: {
          first_name: "John",
          formatted_name: "John Smith",
          last_name: "Smith"
        },
        org: {
          company: "WhatsApp",
          department: "Design",
          title: "Manager"
        },
        phones: [
          {
            phone: "+1 (940) 555-1234",
            type: "HOME"
          },
          {
            phone: "+1 (650) 555-1234",
            type: "WORK",
            wa_id: "16505551234"
          }
        ],
        urls: [
          {
            url: "https://www.facebook.com",
            type: "WORK"
          }
        ]
      }
    ]
  }
)

client.messaging.send(
  from: VONAGE_WHATSAPP_NUMBER,
  to: TO_NUMBER,
  **message
)
