class Event
  attr_accessor :time, :talks

  def initialize(attributes)
    self.time = attributes['time']
    self.talks = attributes['talks'].map do |talk|
      Talk.new(talk)
    end
  end

  def time
    @time =~ /(.*) (am|pm)/
    $1
  end

  def self.days
    if @all_by_day.nil?
      load_events
    end
    @all_by_day.keys
  end

  def self.all_on(day)
    if @all_by_day.nil?
      load_events
    end
    @all_by_day[day]
  end

  def self.filename
    'events.json'
  end

  def self.load_events
    @all_by_day = {}
    speakers_data = DataStore.read_as_json(filename)
    speakers_data.each do |day, talks|
      @all_by_day[day] = talks.map do |speaker_attributes|
        new(speaker_attributes)
      end
    end
  end

  def self.reload
    @all_by_day = nil
  end

end
