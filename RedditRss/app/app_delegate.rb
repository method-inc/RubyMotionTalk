class AppDelegate < ProMotion::AppDelegateParent
  @@nui_settings = NUISettings.init
##  @@nui_settings.setAutoUpdatePath("/Users/mrickert/Dropbox/Rickert/Motion-RideCast/vendor/Pods/NUI/NUI/Themes/Default.NUI.nss")

  def on_load(app, options)
    @nui = NUIAppearance.init

    open RedditRssViewController.new(nav_bar: true)
  end

end
