class Updater
  def initialize

    check_for_data_updates
    @timer = EM.add_periodic_timer interval do
      check_for_data_updates
    end
  end

  SECONDS_IN_MINUTE = 60
  MINUTES_IN_HOUR   = 60
  def interval
    SECONDS_IN_MINUTE * MINUTES_IN_HOUR * 6
  end

  def check_for_data_updates
    puts 'Checking for updates'
    check_for_updates(Speaker)
    check_for_updates(Event,     root_screen.schedule_screen)
    check_for_updates(Sponsor,   root_screen.sponsors_screen)
    check_for_updates(Organizer)
  end

  def check_for_updates(model, screen_to_update=nil)
    url = "https://raw.github.com/alexrothenberg/wicked-good-ruby-app/master/resources/#{model.filename}"
    BW::HTTP.get(url) do |response|
      if response.ok?
        DataStore.write model.filename, response.body.to_s

        model.reload
        screen_to_update.update_table_data if screen_to_update
      end
    end
  end

  def root_screen
    UIApplication.sharedApplication.delegate.home_screen
  end

end
