# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
VERIFY_NUMBER = ENV['VERIFY_NUMBER']
VERIFY_BRAND_NAME = ENV['VERIFY_BRAND_NAME']
VERIFY_WORKFLOW_ID = ENV['VERIFY_WORKFLOW_ID']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.verify.request(
  number: VERIFY_NUMBER,
  brand: VERIFY_BRAND_NAME
  workflow_id: VERIFY_WORKFLOW_ID
)
