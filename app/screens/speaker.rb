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
        @scrolly = subview UIScrollView, :scrolly do
          @links_view = subview UIView,      :links do
            speaker.links.keys.each_with_index do |type, index|
              image_view = subview UIImageView, "link_#{index+1}".to_sym, image: UIImage.imageNamed("#{type}.png")
              image_view.when_tapped do
                show_url speaker.links[type]
              end
            end
          end
          @about_view         = subview UILabel, :about,         text: speaker.about,         numberOfLines: 0
          @talk_view          = subview UILabel, :talk_title,    text: speaker.talk_title
          @talk_abstract_view = subview UILabel, :talk_abstract, text: speaker.talk_abstract, numberOfLines: 0 if speaker.talk_abstract
        end
      end
      full_width = view.frame.size.width - 16
      @about_view.sizeToFit
      @about_view.frame         = [@about_view.origin, [full_width, @about_view.size.height]]
      @talk_view.frame          = [[8, @about_view.bottom + 10], [full_width, 22]]

      if @talk_abstract_view
        @talk_abstract_view.frame = [[8, @talk_view.bottom ], [full_width, 22]]
        @talk_abstract_view.sizeToFit
        bottom_view = @talk_abstract_view
      else
        bottom_view = @talk_view
      end
      @scrolly.contentSize = [view.frame.size.width, bottom_view.bottom]

    end

    def show_url(url)
      web_screen = WebScreen.new
      web_screen.open_url(url)
      open_screen web_screen
    end

  end
end