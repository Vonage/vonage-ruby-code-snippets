require 'sinatra'
require 'json'

post "/webhooks/messages/inbound" do
  payload = JSON.parse(request.body.read)
  puts "Received inbound message webhook:\n#{payload}\n\n"

  status 200

  status 200
end

set :port, 3000