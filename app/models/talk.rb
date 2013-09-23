class Talk
  attr_accessor :title, :abstract, :location, :speaker_id

  def initialize(attributes)
    [:title, :location, :speaker_id].each do |attribute|
      send("#{attribute}=", attributes[attribute.to_s])
    end
    self.abstract = (attributes['abstract'] || []).join("\n")
  end

  def speaker
    Speaker.find_by_id(speaker_id)
  end
end
