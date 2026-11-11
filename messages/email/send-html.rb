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
  type: 'html',
  message: {
		body: "<h1>Hello from Vonage</h1><p>This is an Email HTML message sent via the Vonage Messages API.</p>"
	},
	opts: {
		email: {
			subject: 'Your HTML message subject'
		}
	}
)

client.messaging.send(
  from: EMAIL_SENDER_ID,
  to: MESSAGES_TO_EMAIL,
  **message
)
