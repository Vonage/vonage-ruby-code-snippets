require 'dotenv/load'
require 'nexmo'

NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']
NEXMO_APPLICATION_PRIVATE_KEY_PATH = ENV['NEXMO_APPLICATION_PRIVATE_KEY_PATH']
UUID = ENV['UUID']

client = Nexmo::Client.new(
  application_id: NEXMO_APPLICATION_ID,
  private_key: File.read(NEXMO_APPLICATION_PRIVATE_KEY_PATH)
)

DIGITS = '332393'
response = client.voice.dtmf.send(UUID, digits: DIGITS)

puts response.inspect