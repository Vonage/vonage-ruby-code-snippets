require 'json'
require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
UUID = ENV['UUID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

ncco = {"type": "ncco", "url": ["https://raw.githubusercontent.com/nexmo-community/ncco-examples/gh-pages/transfer.json"]}

response = client.voice.transfer(UUID, destination: ncco)

puts response.inspect