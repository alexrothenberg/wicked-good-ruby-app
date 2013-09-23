module Screen
  class Speaker < PM::Screen
    attr_accessor :speaker

    stylesheet :speaker_styles

    def on_load
      self.title = speaker.name
    end

    def will_present
      layout(view, :main_view) do
        subview UIImageView, :photo, image: UIImage.imageNamed(speaker.photo)
        subview UILabel,     :name,  text: speaker.name
        subview UIView,      :links do
          speaker.links.each do |type, link|
            subview UIImageView, :link, image: UIImage.imageNamed("#{type}.png")
          end
        end
        @about_view         = subview UILabel, :about,         text: speaker.about,         numberOfLines: 0
        @talk_view          = subview UILabel, :talk_title,    text: speaker.talk_title
        @talk_abstract_view = subview UILabel, :talk_abstract, text: speaker.talk_abstract, numberOfLines: 0 if speaker.talk_abstract
      end
      full_width = view.frame.size.width
      @about_view.sizeToFit
      @talk_view.frame          = [[0, @about_view.origin.y + @about_view.size.height], [full_width, 22]]
      if @talk_abstract_view
        @talk_abstract_view.frame = [[0, @talk_view.origin.y  + @talk_view.size.height ], [full_width, 22]]
        @talk_abstract_view.sizeToFit
      end
    end

  end
end