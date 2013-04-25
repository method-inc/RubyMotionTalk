class RedditRssViewController < ProMotion::GroupedTableScreen

  title "RedditRSS"
  APIURL = "http://www.reddit.com/.rss"

  def on_load
    @refresh = UIRefreshControl.alloc.init
    @refresh.attributedTitle = NSAttributedString.alloc.initWithString("Pull to Refresh")
    @refresh.addTarget(self, action:'refreshView:', forControlEvents:UIControlEventValueChanged)
    self.refreshControl = @refresh

    on_refresh do
      on_appear
    end
  end

  def on_appear
    @items = []

    @feed_parser = BW::RSSParser.new(APIURL)
    # feed_parser.delegate = self
    @feed_parser.parse do |item|
      @items << {
        title: item.title,
        subtitle: item.pubDate,
        cell_style: UITableViewCellStyleSubtitle,
        action: :tapped_cell,
        arguments: { location: item.link }
      }
      self.update_table_data
      end_refreshing
    end

  end

  def tapped_cell(args={})
    App.open_url(args[:location])
  end

  def table_data
    data = [{
      title: "Top Reddit Articles:",
      cells: @items
    }]
  end

  # UIRefreshControl Delegates
  def refreshView(refresh)
    refresh.attributedTitle = NSAttributedString.alloc.initWithString("Refreshing data...")
    @on_refresh.call if @on_refresh
  end

  def on_refresh(&block)
    @on_refresh = block
  end

  def end_refreshing
    return unless @refresh

    @refresh.attributedTitle = NSAttributedString.alloc.initWithString("Last updated on #{Time.now.strftime("%H:%M:%S")}")
    @refresh.endRefreshing
  end


end
