require 'dotenv/load'
require 'sinatra'
require 'sinatra/multi_route'
require 'json'

VOICE_TO_NUMBER = ENV['VOICE_TO_NUMBER']
VONAGE_VIRTUAL_NUMBER = ENV['VONAGE_VIRTUAL_NUMBER']

before do
  content_type :json
end

helpers do
  def parsed_body
    JSON.parse(request.body.read)
  end
end

route :get, :post, '/webhooks/answer' do
  [
    {
      "action": "record",
      "split": "conversation",
      "channels": 2,
      "eventUrl": ["#{request.base_url}/webhooks/recordings"]
    },
    {
      "action": "connect",
      "from": VONAGE_VIRTUAL_NUMBER,
      "endpoint": [
        {
          "type": "phone",
          "number": VOICE_TO_NUMBER
        }
      ]
    }
  ].to_json
end

route :get, :post, '/webhooks/recordings' do
  recording_url = params['recording_url'] || parsed_body['recording_url']
  puts "Recording URL = #{recording_url}"

  halt 204
end

set :port, 3000
