class Event
  attr_accessor :title

  def initialize(attributes)
    [:title].each do |attribute|
      send("#{attribute}=", attributes[attribute.to_s])
    end
  end

  def self.all_on(day)
    case day
    when :friday
      [new('title'=>'Refactoring'), new('title'=>'Lightning Talks')]
    when :saturday
      [new('title'=>'Saturday 1'), new('title'=>'Saturday 2'), new('title'=>'Saturday 3')]
    when :sunday
      [new('title'=>'Sunday')]
    end
  end
end
