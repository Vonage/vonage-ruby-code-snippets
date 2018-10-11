require 'sinatra'
require 'sinatra/multi_route'
require 'json'
require '../helpers/helpers'

route :get, :post, '/webhooks/delivery-receipt' do
  puts params.merge(parsed_body)
  status 204
end

set :port, 3000
