module Screen
  class Speaker < PM::Screen
    attr_accessor :speaker

    stylesheet :speaker_styles

    def on_load
      self.title = speaker.short_name
    end

    def will_present
      layout(view, :main_view) do |main_view|
        subview UIImageView, :photo, image: UIImage.imageNamed(speaker.photo)
        @scrolly = subview UIScrollView, :scrolly, showsVerticalScrollIndicator: false do
          about_section
          talk_section
        end
      end

      layout_about_section
      layout_talk_section
      @scrolly.contentSize = [@scrolly.width, @talk_section.bottom + (VERTICAL_MARGIN*2) + TOP_BELOW_MM_NAV]
    end

    def about_section
      @about_section = subview(UIView, :about_section) do |about_section|
        @about_title = subview UILabel, :title, text: speaker.name, numberOfLines: 0
        @about_view = subview UILabel, :body, text: speaker.about, numberOfLines: 0
        @links_view = subview UIView, :links do
          speaker.links.keys.each_with_index do |type, index|
            image_view = subview UIImageView, "link_#{index+1}".to_sym, image: UIImage.imageNamed("#{type}.png")
            image_view.when_tapped do
              show_url speaker.links[type]
            end
          end
        end
      end
    end

    def talk_section
      @talk_section = subview(UIView, :talk_section) do
        @talk_title_view    = subview UILabel, :title, text: speaker.talk_title,    numberOfLines: 0
        @talk_abstract_view = subview UILabel, :body,  text: speaker.talk_abstract, numberOfLines: 0 if speaker.talk_abstract
      end
    end

    def layout_about_section
      size_title(@about_title)
      @about_view.top  = @about_title.bottom
      @about_view.sizeToFit

      @links_view.top   = @about_view.bottom
      @links_view.width = @links_view.subviews.last.right
      @links_view.left  = (@about_section.width - @links_view.width) / 2

      @about_section.height = @links_view.bottom + VERTICAL_MARGIN
    end

    def layout_talk_section
      size_title @talk_title_view
      @talk_abstract_view.top  = @talk_title_view.bottom
      @talk_abstract_view.left = @talk_abstract_view.left

      @talk_abstract_view.sizeToFit
      @talk_section.top    = @about_section.bottom + VERTICAL_MARGIN
      @talk_section.height = @talk_abstract_view.bottom + VERTICAL_MARGIN
    end

    def size_title(title_view)
      left, width  = title_view.left, title_view.width
      title_view.sizeToFit
      title_view.left, title_view.width = left, width
    end

    def show_url(url)
      App.open_url url
    end

  end
end