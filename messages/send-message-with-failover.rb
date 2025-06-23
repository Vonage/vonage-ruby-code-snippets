require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
RCS_SENDER_ID = ENV['RCS_SENDER_ID']
SMS_SENDER_ID = ENV['SMS_SENDER_ID']
MESSAGES_TO_NUMBER = ENV['MESSAGES_TO_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

rcs_message = client.messaging.rcs(
  to: MESSAGES_TO_NUMBER,
  from: RCS_SENDER_ID,
  type: 'text',
  message: 'This is an RCS text message sent via the Vonage Messages API'
)

sms_message = client.messaging.sms(
    to: MESSAGES_TO_NUMBER,
    from: SMS_SENDER_ID,
    message: 'This is a failover SMS message in case the RCS message is rejected.'
  )

client.messaging.send(
  **rcs_message,
  failover: [sms_message]
)
