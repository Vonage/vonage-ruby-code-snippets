# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.applications.update(
  VONAGE_APPLICATION_ID,
  id: VONAGE_APPLICATION_ID,
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
