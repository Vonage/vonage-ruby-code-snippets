require 'json'
require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_CALL_ID = ENV['VOICE_CALL_ID']
VOICE_NCCO_URL = ENV['VOICE_NCCO_URL']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

ncco = {"type": "ncco", "url": [VOICE_NCCO_URL]}

response = client.voice.transfer(VOICE_CALL_ID, destination: ncco)
