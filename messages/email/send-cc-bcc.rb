require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
EMAIL_SENDER_ID = ENV['EMAIL_SENDER_ID']
MESSAGES_TO_EMAIL = ENV['MESSAGES_TO_EMAIL']
MESSAGES_CC_EMAIL = ENV['MESSAGES_CC_EMAIL']
MESSAGES_BCC_EMAIL = ENV['MESSAGES_BCC_EMAIL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.email(
  type: 'text',
  message: 'This is an Email text message sent via the Vonage Messages API',
	opts: {
		email: {
			subject: 'Your message subject',
      cc: [
				{
					address: MESSAGES_CC_EMAIL
				}
			],
			bcc: [
				{
					address: MESSAGES_BCC_EMAIL
				}
			]
		}
	}
)

client.messaging.send(
  from: EMAIL_SENDER_ID,
  to: MESSAGES_TO_EMAIL,
  **message
)
