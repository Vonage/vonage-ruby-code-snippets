# frozen_string_literal: true

require 'dotenv/load'

NEXMO_API_KEY = ENV['NEXMO_API_KEY']
NEXMO_API_SECRET = ENV['NEXMO_API_SECRET']

NEXMO_APPLICATION_ID = ENV['NEXMO_APPLICATION_ID']

require 'nexmo'

client = Nexmo::Client.new(
  api_key: NEXMO_API_KEY,
  api_secret: NEXMO_API_SECRET
)

begin
  response = client.applications_v2.update(
    NEXMO_APPLICATION_ID,
    id: NEXMO_APPLICATION_ID,
    name: 'Ruby Update App',
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
      },
      'voice': {
        'webhooks': {
          'answer_url': {
            'address': 'https://example.com/webhooks/answer',
            'http_method': 'POST'
          },
          'event_url': {
            'address': 'https://example.com/webhooks/event',
            'http_method': 'POST'
          }
        }
      }
    }
  )
  puts 'Application Updated Successfully' if response.id
rescue StandardError => e
  puts e.message
end