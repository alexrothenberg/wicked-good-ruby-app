class Organizer
  attr_accessor :name, :photo, :url

  def initialize(attributes)
    self.name  = attributes['name']
    self.photo = attributes['photo']
    self.url   = attributes['url']
  end

  def self.all
    if @all.nil?
      organizers_data = BW::JSON.parse File.read("#{App.resources_path}/organizers.json")
      @all = organizers_data.map do |organizer_attributes|
        new(organizer_attributes)
      end
    end
    @all
  end


end
