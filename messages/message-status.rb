require 'sinatra'
require 'json'

post "/webhooks/messages/status" do
  payload = JSON.parse(request.body.read)
  puts "Received message status webhook:\n#{payload}\n\n"

  status 200
end

set :port, 3000