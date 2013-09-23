class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    screens = [
      Speakers.new(nav_bar: true),
      Schedule.new(nav_bar: true),
      Location.new(nav_bar: true),
      Sponsors.new(nav_bar: true),
      Organizers.new(nav_bar: true)
    ]
    open_tab_bar(screens)
  end

end
