class Organizer
  attr_accessor :name, :photo, :url

  def initialize(attributes)
    self.name  = attributes['name']
    self.photo = attributes['photo']
    self.url   = attributes['url']
  end

  def self.filename
    'organizers.json'
  end

  def self.all
    if @all.nil?
      organizers_data = DataStore.read_as_json(filename)
      @all = organizers_data.map do |organizer_attributes|
        new(organizer_attributes)
      end
    end
    @all
  end

  def self.reload
    @all = nil
  end


end
