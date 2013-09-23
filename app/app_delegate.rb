class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    screens = [
      Screen::Schedule.new(nav_bar: true),
      Screen::Speakers.new(nav_bar: true),
      Screen::Location.new(nav_bar: true),
      Screen::Sponsors.new(nav_bar: true),
      Screen::Organizers.new(nav_bar: true)
    ]
    open_tab_bar(screens)
  end

end
