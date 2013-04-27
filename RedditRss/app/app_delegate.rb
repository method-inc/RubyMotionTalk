class AppDelegate < ProMotion::AppDelegateParent
  @@nui_settings = NUISettings.init
  #@@nui_settings.setAutoUpdatePath("~/Dropbox/Skookum/RubyMotionTalk/RedditRss/vendor/Pods/NUI/NUI/Themes/Default.NUI.nss")

  def on_load(app, options)
    @nui = NUIAppearance.init

    open RedditRssViewController.new(nav_bar: true)
  end

end
