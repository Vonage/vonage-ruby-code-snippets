# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
TO_NUMBER = ENV['TO_NUMBER']
VONAGE_NUMBER = ENV['VONAGE_NUMBER']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

client.voice.create(
  to: [{
    type: 'phone',
    number: TO_NUMBER
  }],
  from: {
    type: 'phone',
    number: VONAGE_NUMBER
  },
  ncco: [
    {
      'action' => 'talk',
      'text' => 'This is a text to speech call from Vonage'
    }
  ]
)
