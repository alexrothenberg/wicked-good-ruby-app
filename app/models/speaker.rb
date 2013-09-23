class Speaker
  attr_accessor :name, :photo, :links, :about, :talk

  def initialize(attributes)
    [:name, :photo, :links, :about, :talk].each do |attribute|
      send("#{attribute}=", attributes[attribute.to_s])
    end
  end

  def self.all
    if @all.nil?
      speakers_data = BW::JSON.parse File.read("#{App.resources_path}/speakers.json")
      @all = speakers_data.map do |speaker_attributes|
        new(speaker_attributes)
      end
    end
    @all
  end

  def to_s
    attributes = [:name, :photo, :links, :about, :talk].map do |attribute|
      "#{attribute}=#{self.send(attribute)}"
    end

    "#<Speaker:#{object_id} #{attributes.join(' ')}"
  end

end
