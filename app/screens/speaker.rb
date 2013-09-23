module Screen
  class Speaker < PM::Screen
    attr_accessor :speaker

    def on_load
      self.title = speaker.name
    end
  end
end