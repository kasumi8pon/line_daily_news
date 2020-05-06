require 'bundler/setup'
Bundler.require

require_relative 'lib/line_daily_news'

desc '今日のニュース をプッシュ送信する'
task :push_todays_news do
  message_sender = MessageSender.new
  message_sender.push(ENV['ROOM_ID'], Message.todays_news)
end
