require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'

Capybara.default_driver = :selenium_chrome_headless

class DailyNews
  include Capybara::DSL

  BASE_URL = 'https://eikaiwa.dmm.com/app/daily-news'

  def initialize
    @levels = (1..10)
  end

  def latest
    Article.new(urls.first)
  end

  private

  def urls
    @urls ||= begin
      visit "#{BASE_URL}/search/?min_level=#{@levels.min}&max_level=#{@levels.max}"
      all(:css, 'a.css-1cq4ev9').map { |a| a[:href] }
    end
  end
end

class DailyNews::Intermediate < DailyNews
  def initialize
    @levels = (4..6)
  end
end

class Article
  include Capybara::DSL

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def title
    @title ||= begin
      visit @url
      find(:css, 'div.css-bk9fzy span span').text
    end
  end
end
