require 'dotenv/load'
require 'vonage'
require 'time'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

now = Time.now
yesterday = now - (3600 * 24)

response = client.voice.list({date_start: yesterday.utc.iso8601, date_end: now.utc.iso8601})

calls = response._embedded.voice
calls.each do |call|
  puts call.inspect
end