class RootScreen < MMDrawerController
  # You can inherit a screen from any UIViewController if you include the ScreenModule
  # Just make sure to implement the Obj-C methods in cocoatouch/view_controller.rb.
  include ProMotion::ScreenModule

  def self.new(args = {})
    alloc.init.tap do |root_screen|
      root_screen.on_create(args)
    end
  end

  def on_create(args={})
    super

    self.leftDrawerViewController   = Screen::Menu.new(nav_bar: false)
    self.rightDrawerViewController  = nil
    self.centerViewController       = sponsors_screen #schedule_screen

    leftDrawerButton = MMDrawerBarButtonItem.alloc.initWithTarget self, action:"show_menu:"
    navigationItem.setLeftBarButtonItem leftDrawerButton, animated:true
  end

  def will_appear
    self.title = centerViewController.title
  end

  def show_menu(sender)
    toggleDrawerSide MMDrawerSideLeft, animated:true, completion: nil
  end

  def schedule_screen
    @schedule_screen ||= Screen::Schedule.new
  end

  def location_screen
    @location_screen ||= Screen::Location.new
  end

  def sponsors_screen
    @sponsors_screen ||= Screen::Sponsors.new
  end

  def organizers_screen
    @organizers_screen ||= Screen::Organizers.new
  end


end
