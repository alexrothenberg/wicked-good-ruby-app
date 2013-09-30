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

  def self.download_file(filename, &block)
    url = "https://raw.github.com/alexrothenberg/wicked-good-ruby-app/master/resources#{filename}"
    puts "downloading file #{url}"
    BW::HTTP.get(url) do |response|
      if response.ok?
        write_data_to(response.body, "#{App.documents_path}#{filename}")
        block.call
      end
    end
  end

  def self.write_data_to(data, filename)
      error = nil
      NSFileManager.defaultManager.createDirectoryAtPath(File.dirname(filename), withIntermediateDirectories: true, attributes: nil, error: error)
      File.open(filename, 'w') do |f|
        f.write(data)
      end
    end


  def root_screen
    UIApplication.sharedApplication.delegate.home_screen
  end

end
