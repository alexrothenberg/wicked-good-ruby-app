module Screen
  class Organizers < PM::Screen
    stylesheet :organization_styles

    def will_appear
      mm_drawerController.title = 'Organizers'
    end

    def will_present
      self.class.alex = self
      layout(view, :main_view) do
        Organizer.all.each_with_index do |organizer, index|
          organizer_view_for(organizer, index)
        end
      end
    end

    def organizer_view_for(organizer, row)
      top = (row/2 * 168)
      left = (row % 2 == 0) ? 0 : 160
      organizer_view = subview UIView, :organizer, frame: [[left, top], [160, 160]] do
        subview(UIImageView, :photo, image: UIImage.imageNamed(organizer.photo))
        subview(UILabel, :name, text: organizer.name)
        link_view = subview UIImageView, :link, image: UIImage.imageNamed("website.png")
        link_view.when_tapped do
          show_url organizer.url
        end
      end
    end

    def show_url(url)
      App.open_url url
    end

    class << self
      attr_accessor :alex
    end

  end
end