require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
SMS_SENDER_ID = ENV['SMS_SENDER_ID']
SMS_TO_NUMBER = ENV['SMS_TO_NUMBER']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

client.sms.send(
  from: SMS_SENDER_ID,
  to: SMS_TO_NUMBER,
  text: 'A text message sent using the Vonage SMS API'
)
