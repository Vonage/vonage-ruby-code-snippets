require 'sinatra'
require 'sinatra/multi_route'
require 'json'

VOICE_TO_NUMBER = ENV['VOICE_TO_NUMBER']
VONAGE_VIRTUAL_NUMBER = ENV['VONAGE_VIRTUAL_NUMBER']

before do
  content_type :json
end

route :get, :post, '/webhooks/answer' do
  [{
    action: 'connect',
    from: VONAGE_VIRTUAL_NUMBER,
    endpoint: [{
      type: 'phone',
      number: VOICE_TO_NUMBER
    }]
  }].to_json
end

set :port, 3000
