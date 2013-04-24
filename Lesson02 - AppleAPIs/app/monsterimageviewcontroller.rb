class MonsterImageViewController < UIViewController

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    # Display an image based on the title
    bigImage = UIImage.imageNamed("#{self.title.delete(' ').downcase}_large")
    bigImageView = UIImageView.alloc.initWithFrame(
        CGRectMake( 0, 0, self.view.frame.size.width, self.view.frame.size.height )
    )
    bigImageView.image = bigImage
    bigImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
    bigImageView.contentMode = UIViewContentModeScaleAspectFill

    self.view.addSubview bigImageView
  end

  def viewDidAppear(animated)
    @shown ||= 0
    if [1, 5].include? @shown += 1
        puts "Showing #{self.title} for the #{@shown.ordinalize} time."
    end
  end

end
