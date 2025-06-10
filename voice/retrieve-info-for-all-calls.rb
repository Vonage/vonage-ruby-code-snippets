require 'dotenv/load'
require 'vonage'
require 'time'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

now = Time.now
yesterday = now - (3600 * 24)

response = client.voice.list({date_start: yesterday.utc.iso8601, date_end: now.utc.iso8601})
