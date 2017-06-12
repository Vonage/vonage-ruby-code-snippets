require 'dotenv'
require 'nexmo'

Dotenv.load

API_KEY = ENV['API_KEY']
API_SECRET = ENV['API_SECRET']
APPLICATION_ID = ENV['APPLICATION_ID']
PRIVATE_KEY = ENV['PRIVATE_KEY']

puts "What is the conversation_uuid?"

# The conversation uuid will come from a recording's event url. 
# It can be conversation_uuid without the leading "CON-"
# or it can be the last path segment in the recording_url.
conversation_uuid = gets.chomp

client = Nexmo::Client.new(
  key: API_KEY,
  secret: API_SECRET,
  application_id: APPLICATION_ID,
  private_key: File.read(PRIVATE_KEY)
)

response = client.get_file(conversation_uuid)

File.write("recording.mp3", response)
