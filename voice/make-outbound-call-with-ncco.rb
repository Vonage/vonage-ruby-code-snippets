# frozen_string_literal: true

require 'dotenv/load'
require 'nexmo'

NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']
NEXMO_APPLICATION_PRIVATE_KEY_PATH = ENV['NEXMO_APPLICATION_PRIVATE_KEY_PATH']
TO_NUMBER = ENV['TO_NUMBER']
NEXMO_NUMBER = ENV['NEXMO_NUMBER']

client = Nexmo::Client.new(
  application_id: NEXMO_APPLICATION_ID,
  private_key: File.read(NEXMO_APPLICATION_PRIVATE_KEY_PATH)
)

client.voice.create(
  to: [{
    type: 'phone',
    number: TO_NUMBER
  }],
  from: {
    type: 'phone',
    number: NEXMO_NUMBER
  },
  ncco: [
    {
      'action' => 'talk',
      'text' => 'This is a text to speech call from Nexmo'
    }
  ]
)
