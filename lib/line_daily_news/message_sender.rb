require 'line/bot'

class MessageSender
  def initialize
    @client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['CHANNEL_SECRET']
      config.channel_token = ENV['CHANNEL_TOKEN']
    }
  end

  def push(to, message)
    @client.push_message(to, { type: 'text', text: message })
  end

  def reply
    raise NotImplementedError.new("Method '#{__method__}' is not implemented in class '#{self.class.name}'.")
  end
end
