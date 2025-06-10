require 'sinatra'
require 'sinatra/multi_route'
require 'json'

VOICE_CONFERENCE_NAME = ENV['VOICE_CONFERENCE_NAME']

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
      action: "conversation",
      name: VOICE_CONFERENCE_NAME,
      record: "true",
      eventMethod: "POST", 
      eventUrl: ["#{request.base_url}/webhooks/recordings"]
    }
  ].to_json
end

route :get, :post, '/webhooks/recordings' do
  recording_url = params['recording_url'] || parsed_body['recording_url']
  puts "Recording URL = #{recording_url}"

  halt 204
end

set :port, 3000
