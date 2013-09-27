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
      @scrolly.contentSize = [@scrolly.width, @talk_section.bottom]
    end

    def about_section
      @about_section = subview(UIView, :about_section) do |about_section|
        subview UILabel, :title, text: speaker.name
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

    MARGIN = 8
    def layout_about_section
      @about_view.sizeToFit
      @links_view.frame = [[MARGIN, @about_view.bottom], @links_view.size]
      @about_section.frame =  [ @about_section.frame.origin,
                                [@about_section.width, @links_view.bottom + MARGIN]
                              ]
    end

    def layout_talk_section
      @talk_title_view.sizeToFit
      @talk_abstract_view.frame = [ [@talk_abstract_view.left, @talk_title_view.bottom],
                                    @talk_abstract_view.frame.size
                                  ]
      @talk_abstract_view.sizeToFit
      @talk_section.frame = [ [@talk_section.left, @about_section.bottom + MARGIN],
                              [@talk_section.width, @talk_abstract_view.bottom + MARGIN]
                            ]
    end

    def show_url(url)
      App.open_url url
    end

  end
end