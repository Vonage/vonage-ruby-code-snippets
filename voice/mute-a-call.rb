require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_CALL_ID = ENV['VOICE_CALL_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

client.voice.mute(VOICE_CALL_ID)

sleep(5)

client.voice.unmute(VOICE_CALL_ID)