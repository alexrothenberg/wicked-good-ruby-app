class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    open_screen RootScreen.new(nav_bar: true)

    # open_screen Screen::Schedule.new(nav_bar: true)
  end

end
