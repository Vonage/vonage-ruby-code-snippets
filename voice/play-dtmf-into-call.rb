require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_CALL_ID = ENV['VOICE_CALL_ID']
VOICE_DTMF_DIGITS = ENV['VOICE_DTMF_DIGITS']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

response = client.voice.dtmf.send(VOICE_CALL_ID, digits: VOICE_DTMF_DIGITS)
