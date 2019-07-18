# frozen_string_literal: true

require 'sinatra'
require 'sinatra/multi_route'
require 'json'

before do
  content_type :json
end

route :get, :post, '/webhooks/answer' do
  [
    {
      'action' => 'talk',
      'text' => 'Thanks for calling the notification line'
    },
    {
      'action' => 'notify',
      'payload' => {'foo' => 'bar'},
      'eventUrl' => ["#{request.base_url}/webhooks/notification"]
    },
    {
      'action' => 'talk',
      'text' => 'You will never hear me as the notification URL will return an NCCO'
    }
  ].to_json
end

route :get, :post, '/webhooks/notification' do
  puts params
  [
    {
      'action' => 'talk',
      'text' => 'Your notification has been received, loud and clear'
    }
  ].to_json
end

route :get, :post, '/webhooks/event' do
  puts params
  halt 204
end

set :port, 3000
