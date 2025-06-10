require 'sinatra'
require 'sinatra/multi_route'
require 'json'

VOICE_CONFERENCE_NAME = ENV['VOICE_CONFERENCE_NAME']

before do
  content_type :json
end

route :get, :post, '/webhooks/answer' do
  [
    {
      action: 'talk',
      text: 'Please wait while we connect you to the conference'
    },
    {
      action: 'conversation',
      name: VOICE_CONFERENCE_NAME
    }
  ].to_json
end

set :port, 3000
