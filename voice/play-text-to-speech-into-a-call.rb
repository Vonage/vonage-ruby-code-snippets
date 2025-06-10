require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_CALL_ID = ENV['VOICE_CALL_ID']
VOICE_TEXT = ENV['VOICE_TEXT']
VOICE_LANGUAGE = ENV['VOICE_LANGUAGE']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

response = client.voice.talk.start(VOICE_CALL_ID, text: VOICE_TEXT, language: VOICE_LANGUAGE)
