require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VERIFY_TEMPLATE_ID = ENV['VERIFY_TEMPLATE_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_PRIVATE_KEY)
)

client.verify2.template_fragments.create(
  template_id: VERIFY_TEMPLATE_ID,
  channel: 'sms',
  locale: 'en-us',
  text: 'The authentication code for your ${brand} is: ${code}'
)
