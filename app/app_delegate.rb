class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    open_screen RootScreen.new(nav_bar: true)

    @updater = Updater.new
  end

end
