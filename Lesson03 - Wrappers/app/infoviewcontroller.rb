class InfoViewController < UIViewController

  def viewDidLoad
    super

    statusBarHeight = UIApplication.sharedApplication.statusBarFrame.size.height;

    @textArea = UITextView.alloc.initWithFrame(
      CGRectMake(0, statusBarHeight, Device.screen.width, Device.screen.height - statusBarHeight)
    )
    @textArea.editable = false
    @textArea.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
    @textArea.accessibilityLabel = "Test Me!"

    self.view.addSubview @textArea

    @viewTapped = false
  end

  def viewDidAppear(animated)
    s ||= nnnn

    s << "App's name / identifier:" + n
    s << "#{App.name} / #{App.identifier}" + nn

    s << "Here's a unique ID:" + n
    s << BubbleWrap.create_uuid + nn

    s << "Documents Path:" + n
    s << App.documents_path + nn

    s << "Front Camera Available?" + n
    s << Device.camera.front?.to_s + nn

    @textArea.text = s

    @textArea.when_tapped do
      @viewTapped = true

      #Create an SVProgressHUD with the date in it.
      SVProgressHUD.showSuccessWithStatus(NSDate.new.to_s)

      EM.add_timer 2.0 do
        SVProgressHUD.showErrorWithStatus("Timer Fired!")
      end

    end

  end

  # Create methods dynamically, just like doing:
  # def n
  #   "\n"
  # end
  #
  # def nn
  #   "\n" * 2
  # end
  #
  # ...

  (1..4).each do |i|
    define_method("n" * i) { "\n" * i }
  end

end
