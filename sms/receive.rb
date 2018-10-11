require 'sinatra'
require 'sinatra/multi_route'
require 'json'
require '../helpers/helpers.rb'

route :get, :post, '/webhooks/inbound-sms' do
  puts params.merge(parsed_body)
  status 204
end

set :port, 3000
