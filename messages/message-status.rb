require 'sinatra'
require 'json'

post "/webhooks/messages/status" do
  puts "Received message status webhook:\n\n"
  p JSON.parse(request.body.read)
  status 200
end

set :port, 3000