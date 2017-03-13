require 'faye/websocket'
require 'sinatra'
require 'thin'
require 'json'

# To run this code sample you need to install: gem install faye-websocket sinatra thin
# See https://docs.nexmo.com/voice/voice-api/websockets for more instructions

Faye::WebSocket.load_adapter('thin')

get '/' do
  if Faye::WebSocket.websocket?(request.env)
    ws = Faye::WebSocket.new(request.env)

    ws.on(:open) do |event|
      puts 'client connected'
    end

    ws.on(:message) do |event|
      #Check if message is Binary or Text
      if event.data.is_a? Array
        #Echo the binary message back to where it came from
        ws.send(event.data)
      else
        puts event.data
      end
    end

    ws.on(:close) do |event|
      puts 'client disconnected'
      ws = nil
    end

    ws.on(:error) do |event|
      puts 'client error'
      puts event.message
    end

    ws.rack_response
  end
end

get '/ncco' do
  content_type :json
  [
    {
      "action": "connect",
      "eventUrl": [
        "https://example.com/events"
      ],
      "from": "441632960960",
      "endpoint": [
        {
          "type": "websocket",
          "uri": "ws://example.com/socket",
          "content-type": "audio/l16;rate=16000"
        }
      ]
    }
  ].to_json
end

post '/event' do
  puts params
end
