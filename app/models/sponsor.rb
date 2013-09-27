class Sponsor
  attr_accessor :logo, :url

  def initialize(attributes)
    self.logo = attributes['logo']
    self.url = attributes['url']
  end

  def self.types
    if @all_by_type.nil?
      load
    end
    @all_by_type.keys
  end

  def self.all_of(type)
    if @all_by_type.nil?
      load
    end
    @all_by_type[type]
  end

  def self.load
    @all_by_type = {}
    sponsors_data = BW::JSON.parse File.read("#{App.resources_path}/sponsors.json")
    sponsors_data.each do |type, sponsors|
      @all_by_type[type] = sponsors.map do |sponsor_attributes|
        new(sponsor_attributes)
      end
    end
  end

end
