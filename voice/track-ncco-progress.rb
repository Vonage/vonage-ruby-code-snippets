require 'dotenv'

Dotenv.load

NEXMO_NUMBER = ENV['NEXMO_NUMBER']
TO_NUMBER = ENV['TO_NUMBER']

require 'sinatra'
require 'sinatra/multi_route'
require 'json'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser

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
    [
      'action' => 'talk',
      'text' => 'Thanks for calling the notification line'
    ],
    [
      'action' => 'notify',
      'payload' => ['foo' => 'bar'],
      'eventUrl' => ["#{request.base_url}/webhooks/notification"]
    ],
    [
      'action' => 'talk',
      'text' => 'You will never hear me as the notification URL will return an NCCO'
    ]
  ].to_json
end

route :get, :post, '/webhooks/notification' do
  [
    [
      'action' => 'talk',
      'text' => 'Your notification has been received, loud and clear'
    ]
  ].to_json

  puts params
end

route :get, :post, '/webhooks/notification' do
  puts params
  halt 204
end

set :port, 3000