describe "Application 'wrappers'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
end

describe "InfoViewController" do
  tests InfoViewController

  it "changes tapped instance variable when tapped" do
    rotate_device :to => :landscape
    tap "Test Me!"
    controller.instance_variable_get("@viewTapped").should == true
    rotate_device :to => :protrait
  end
end