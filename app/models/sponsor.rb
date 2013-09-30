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

  def self.filename
    'sponsors.json'
  end

  def self.load
    @all_by_type = {}
    sponsors_data = DataStore.read_as_json(filename)
    sponsors_data.each do |type, sponsors|
      @all_by_type[type] = sponsors.map do |sponsor_attributes|
        new(sponsor_attributes)
      end
    end
  end

  def self.reload
    @all_by_type = nil
  end


end
