# frozen_string_literal: true

require 'json'
require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_CALL_ID = ENV['VOICE_CALL_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

ncco = {
  "type": 'ncco',
  "ncco": [
    "action": 'talk',
    "text": 'This is a transfer action using an inline NCCO'
  ]
}

response = client.voice.transfer(VOICE_CALL_ID, destination: ncco)
