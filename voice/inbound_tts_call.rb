require 'sinatra'
require 'sinatra/multi_route'
require 'json'
require '../helpers/helpers.rb'

before do
  content_type :json
end

route :get, :post, '/webhooks/answer' do
  from = params['from'] || parsed_body['from']
  from_split_into_characters = from.split('').join(' ')

  [{
    action: 'talk',
    text: "Thank you for calling from #{from_split_into_characters}"
  }].to_json
end

set :port, 3000
