require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
NEXMO_NUMBER = ENV['NEXMO_NUMBER']

SMS_CALLBACK_URL = ENV['SMS_CALLBACK_URL']
NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']
VOICE_CALLBACK_TYPE = ENV['VOICE_CALLBACK_TYPE']
VOICE_CALLBACK_VALUE = ENV['VOICE_CALLBACK_VALUE']
VOICE_STATUS_URL = ENV['VOICE_STATUS_URL']

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.numbers.update(
    country: COUNTRY_CODE,
    msisdn: NEXMO_NUMBER,
    app_id: NEXMO_APPLICATION_ID,
    voiceCallbackType: VOICE_CALLBACK_TYPE,
    voiceCallbackValue: VOICE_CALLBACK_VALUE,
    voiceStatusCallback: VOICE_STATUS_URL,
    moHttpUrl: SMS_CALLBACK_URL
  )
  puts "Number updated"
rescue
  puts "Error updating number"
end