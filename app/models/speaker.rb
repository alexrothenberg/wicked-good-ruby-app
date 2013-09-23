class Speaker
  attr_accessor :id, :name, :photo

  def initialize(attributes)
    self.id    = attributes['id']
    self.name  = attributes['name']
    self.photo = attributes['photo']
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

end
