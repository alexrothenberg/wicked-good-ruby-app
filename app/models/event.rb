class Event
  attr_accessor :time, :talks

  def initialize(attributes)
    # puts attributes.inspect
    [:time, :talks].each do |attribute|
      send("#{attribute}=", attributes[attribute.to_s])
    end
    # puts self.talks.inspect
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

  def self.load_events
    @all_by_day = {}
    speakers_data = BW::JSON.parse File.read("#{App.resources_path}/events.json")
    speakers_data.each do |day, talks|
      @all_by_day[day] = talks.map do |speaker_attributes|
        new(speaker_attributes)
      end
    end
  end

end