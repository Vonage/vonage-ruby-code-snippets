require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_PRIVATE_KEY = ENV['VONAGE_PRIVATE_KEY']
VERIFY_TEMPLATE_ID = ENV['VERIFY_TEMPLATE_ID']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: VONAGE_PRIVATE_KEY
)

template = client.verify2.templates.update(
  template_id: VERIFY_TEMPLATE_ID,
  name: 'my-renamed-template',
  is_default: false
)
