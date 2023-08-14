require 'dotenv/load'
require 'vonage'

VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VONAGE_APPLICATION_PRIVATE_KEY_PATH = ENV['VONAGE_APPLICATION_PRIVATE_KEY_PATH']
THEME_ID = ENV['THEME_ID']
MAIN_COLOR = ENV['MAIN_COLOR']
BRAND_TEXT = ENV['BRAND_TEXT']

client = Vonage::Client.new(
  application_id: VONAGE_APPLICATION_ID,
  private_key: File.read(VONAGE_APPLICATION_PRIVATE_KEY_PATH)
)

client.meetings.themes.update(
  theme_id: THEME_ID,
  main_color: MAIN_COLOR,
  brand_text: BRAND_TEXT
)
