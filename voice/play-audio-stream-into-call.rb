require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
UUID = ENV['UUID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)
    
AUDIO_URL = 'https://nexmo-community.github.io/ncco-examples/assets/voice_api_audio_streaming.mp3'
response = client.voice.stream.start(UUID, stream_url: [AUDIO_URL])

puts response.inspect