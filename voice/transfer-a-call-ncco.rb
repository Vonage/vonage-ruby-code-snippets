# frozen_string_literal: true

require 'json'
require 'dotenv/load'

NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']
NEXMO_APPLICATION_PRIVATE_KEY_PATH = ENV['NEXMO_APPLICATION_PRIVATE_KEY_PATH']
UUID = ENV['UUID']

require 'nexmo'

client = Nexmo::Client.new(
  application_id: NEXMO_APPLICATION_ID,
  private_key: File.read(NEXMO_APPLICATION_PRIVATE_KEY_PATH)
)

ncco = {
  "type": 'ncco',
  "ncco": [
    "action": 'talk',
    "text": 'This is a transfer action using an inline NCCO'
  ]
}

response = client.calls.transfer(UUID, destination: ncco)

puts response.inspect
