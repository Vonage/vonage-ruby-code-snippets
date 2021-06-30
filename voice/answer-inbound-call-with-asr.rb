require 'sinatra'
require 'sinatra/multi_route'
require 'rack/contrib'

use Rack::JSONBodyParser

before do
  content_type :json
end

route :get, :post, '/webhooks/answer' do
  [
    {
      action: 'talk',
      text: 'Please say something'
    },
    {
      action: 'input',
      type: [ 'speech' ],
      eventUrl: ["#{request.base_url}/webhooks/asr"],
      speech: {
        endOnSilence: 1,
        uuid: [params[:uuid]],
        language: 'en-US'
      }
    }
  ].to_json
end

route :post, '/webhooks/asr' do
  [{
    action: 'talk',
    text: "You said #{params["speech"]["results"][0]["text"]}"
  }].to_json
end

route :post, '/webhooks/event' do
  puts params
end

set :port, 3000
