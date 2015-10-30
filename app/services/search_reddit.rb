class SearchReddit
  require 'mechanize'
  attr_reader :page

  def initialize
    @agent = Mechanize.new
    @page = @agent.get('http://www.reddit.com/r/gamedeals')
  end

  def perform
    nodes = @page.search(".thing")
    nodes.each do |node|
      node_title = node.css('.title').text.parameterize.gsub("-", " ")
      Game.find_each do |game|
        if node_title.include?(game.search_term)
          node_links = node.css('a').map { |link| link['href'] }
          comments_link = ""
          node_links.each do |link|
            comments_link = link if link.include?("/comments/")
          end

          unless GameDeal.exists?(comments_url: comments_link)
            game.game_deals.create(comments_url: comments_link, deal_url: node_links.first)
          end
        end
      end
    end
  end
end
