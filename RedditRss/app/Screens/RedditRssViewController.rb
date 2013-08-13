class RedditRssViewController < ProMotion::TableScreen
  refreshable
  searchable

  title "RedditRSS"
  APIURL = "http://www.reddit.com/.rss"

  def on_load
    @items = []
  end

  def on_refresh
    on_appear
  end

  def on_appear
    @feed_parser = BW::RSSParser.new(APIURL)
    # # feed_parser.delegate = self
    @feed_parser.parse do |item|
      @items << {
        title: item.title,
        subtitle: item.pubDate,
        cell_style: UITableViewCellStyleSubtitle,
        action: :tapped_cell,
        arguments: { location: item.link }
      }
      update_table_data
      end_refreshing
    end

  end

  def tapped_cell(args={})
    App.open_url(args[:location])
  end

  def table_data
    [{
      title: "Top Reddit Articles:",
      cells: @items
    }]
  end

end
