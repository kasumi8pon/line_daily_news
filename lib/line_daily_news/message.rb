class Message
  def self.todays_news
    article = DailyNews::Intermediate.new.latest
    "今日のニュースはこれだよ\n【#{article.title}】\n#{article.url}"
  end
end
