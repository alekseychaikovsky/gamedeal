class SearchReddit
  require 'mechanize'

  def initialize
    @agent = Mechanize.new
    @page = @agent.get('http://www.reddit.com/r/gamedeals')
  end

  def perform
    @page.search("p.title").text.downcase.include?
  end
end
