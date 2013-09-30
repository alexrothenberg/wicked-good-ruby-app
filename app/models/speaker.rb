class Speaker
  attr_accessor :id, :name, :photo, :links, :about, :talk, :short_name

  def initialize(attributes)
    [:id, :name, :photo, :links, :about, :short_name].each do |attribute|
      send("#{attribute}=", attributes[attribute.to_s])
    end
    self.talk = Talk.new attributes['talk']
  end

  def short_name
    @short_name || name
  end

  def talk_title
    talk.title
  end

  def talk_abstract
    talk.abstract
  end

  def self.filename
    'speakers.json'
  end

  def self.all
    if @all.nil?
      speakers_data = DataStore.read_as_json(filename)
      @all = speakers_data.map do |speaker_attributes|
        new(speaker_attributes)
      end
    end
    @all
  end

  def self.reload
    @all = nil
  end

  def self.find_by_id(id)
    all.detect do |speaker|
      speaker.id == id
    end
  end

  def to_s
    attributes = [:name, :photo, :links, :about, :talk].map do |attribute|
      "#{attribute}=#{self.send(attribute)}"
    end

    "#<Speaker:#{object_id} #{attributes.join(' ')}"
  end

end
