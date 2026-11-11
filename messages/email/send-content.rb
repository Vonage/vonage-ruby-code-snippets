require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
EMAIL_SENDER_ID = ENV['EMAIL_SENDER_ID']
MESSAGES_TO_EMAIL = ENV['MESSAGES_TO_EMAIL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

message = client.messaging.email(
  type: 'content',
  message: [
		{
      type: 'text',
      body: 'This is the plain-text body.'
    },
    {
			type: 'html',
			body: "<p>This is the <strong>HTML</strong> body.</p>"
		}
	],
	opts: {
		email: {
			subject: 'Your content message subject'
		}
	}
)

client.messaging.send(
  from: EMAIL_SENDER_ID,
  to: MESSAGES_TO_EMAIL,
  **message
)
