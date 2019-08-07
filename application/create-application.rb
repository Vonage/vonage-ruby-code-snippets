# frozen_string_literal: true

require 'dotenv'

Dotenv.load

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.applications_v2.create(
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