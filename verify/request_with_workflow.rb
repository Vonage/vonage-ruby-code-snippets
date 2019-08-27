# frozen_string_literal: true

require 'dotenv/load'
require 'nexmo'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']
RECIPIENT_NUMBER = ENV['RECIPIENT_NUMBER']

WORKFLOW_ID = ARGV[0]
if WORKFLOW_ID.empty?
  puts 'Please supply the workflow_id'
  exit
end

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

response = client.verify.request(
  number: RECIPIENT_NUMBER,
  brand: 'AcmeInc',
  workflow_id: WORKFLOW_ID
)

if response.status == '0'
  # display the Verify `request_id`
  puts response.request_id
else
  puts response.error_text
end
