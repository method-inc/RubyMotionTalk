class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    # Standard Application setup for iOS
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Lets mix some ruby in here for fun too!
    mythicalCreatures = %w(Chupacabra Jersey\ Devil Lizard\ Girl)

    # If the device is an iPad, make sure to show the Yeti
    if isIpad?
      mythicalCreatures << "Yeti"
    end

    # Create the tab bar controller and add it to the applicaiton
    myTabBarController = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    myTabBarController.delegate = self;

    viewControllerHolder = []

    # Loop through all the creatures
    mythicalCreatures.each_with_index do |creature,index|
      # Find the image we're looking for in the /resources folder
      creatureImage = UIImage.imageNamed(creature.delete(' ').downcase)

      # Initialize the view controller, set its title and add it to the array of view controllers
      viewController = MonsterImageViewController.new
      viewController.title = creature
      viewController.tabBarItem = UITabBarItem.alloc.initWithTitle(creature, image:creatureImage, tag:index)
      navController = UINavigationController.alloc.initWithRootViewController(viewController)

      viewControllerHolder << navController
    end

    #Set the tab bar's view controllers
    myTabBarController.viewControllers = viewControllerHolder


    @window.rootViewController = myTabBarController
    @window.makeKeyAndVisible

    true
  end

  def isIpad?
    (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
  end

end
