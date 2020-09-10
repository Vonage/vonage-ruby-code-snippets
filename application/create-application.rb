# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.applications.create(
    name: 'Code Example App',
    capabilities: {
      'messages': {
        'webhooks': {
          'inbound_url': {
            'address': 'https://example.com/webhooks/inbound',
            'http_method': 'POST'
          },
          'status_url': {
            'address': 'https://example.com/webhooks/status',
            'http_method': 'POST'
          }
        }
      }
    }
  )
  puts "Application #{response.id} Created Successfully" if response.id
rescue StandardError => e
  puts e.message
end