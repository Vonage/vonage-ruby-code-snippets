require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
TEMPLATE_ID = ENV['VERIFY_TEMPLATE_ID']
TEMPLATE_FRAGMENT_ID= ENV['VERIFY_TEMPLATE_FRAGMENT_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

client.verify2.template_fragments.update(
  template_id: TEMPLATE_ID,
  template_fragment_id: TEMPLATE_FRAGMENT_ID,
  text: 'The one-time authentication code for your ${brand} is: ${code}'
)
