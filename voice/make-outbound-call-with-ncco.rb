# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VOICE_TO_NUMBER = ENV['VOICE_TO_NUMBER']
VONAGE_VIRTUAL_NUMBER = ENV['VONAGE_VIRTUAL_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

client.voice.create(
  to: [{
    type: 'phone',
    number: VOICE_TO_NUMBER
  }],
  from: {
    type: 'phone',
    number: VONAGE_VIRTUAL_NUMBER
  },
  ncco: [
    {
      'action' => 'talk',
      'text' => 'This is a text to speech call from Vonage'
    }
  ]
)
