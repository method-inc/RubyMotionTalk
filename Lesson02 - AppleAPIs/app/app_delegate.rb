class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    # Standard Application setup for iOS
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Lets mix some ruby in here for fun too!
    mythicalCreatures = %w(Chupacabra Jersey\ Devil Lizard\ Girl)
    
    if isIpad?
      mythicalCreatures << "Yeti"
    end

    # Create the tab bar controller and add it to the applicaiton
    myTabBarController = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    myTabBarController.delegate = self;        

    viewControllerHolder = []

    mythicalCreatures.each_with_index do |creature,index|
      creatureImage = UIImage.imageNamed(creature.delete(' ').downcase)

      viewController = GenericViewController.new
      viewController.title = creature
      viewController.tabBarItem = UITabBarItem.alloc.initWithTitle(creature, image:creatureImage, tag:index)
      navController = UINavigationController.alloc.initWithRootViewController(viewController)

      viewControllerHolder << navController
    end

    myTabBarController.viewControllers = viewControllerHolder


    @window.rootViewController = myTabBarController
    @window.makeKeyAndVisible

    true
  end

  def isIpad?
    (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
  end

end
