module Screen
  class Location < PM::Screen
    def will_appear
      mm_drawerController.title = 'Location'
    end

    stylesheet :location_styles

    def will_present
      layout(view, :main_view) do
        subview UILabel,     :name,           text: 'Seaport World Trade Center'
        subview UIButton,    :address,        title: '200 Seaport Blvd Boston, MA 02210'
        @map = subview UIButton, :map_button, title: 'Show Map'
        subview UIImageView, :photo,          image: UIImage.imageNamed('seaport.jpg')
        subview UIButton,    :book_room,      title: 'Book a Room'
      end

      @map.when_tapped { load_map }
    end

    def load_map
      App.open_url 'http://maps.apple.com/?ll=42.351016,-71.040786&spn=0.01&q=44+Commonwealth+Pier+Boston%2C+MA+02210'
    end
  end
end
