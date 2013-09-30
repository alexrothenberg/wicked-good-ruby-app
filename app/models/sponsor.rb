class Sponsor
  attr_accessor :logo, :url

  def initialize(attributes)
    self.logo = attributes['logo']
    self.url = attributes['url']
  end

  def logo_missing?
    logo_filename.nil?
  end

  def logo_filename
    possibilities = ["#{App.documents_path}/sponsors/#{logo}", "#{App.resources_path}/sponsors/#{logo}"]
    possibilities.detect do |path|
      File.exists? path
    end
  end

  def self.types
    [
      "Wicked Good Sponsor",
      "Track Sponsor",
      "Workshop Sponsor",
      "Very Good Sponsors",
      "Good Sponsors",
      "Kinda Good Sponsors",
      "Lightning Talk Sponsor",
      "Video Recorded By",
      "Childcare Sponsor",
      "Lanyard Sponsor"
    ]
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
