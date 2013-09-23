module Screen
  class Location < PM::Screen
    title 'Location'

    stylesheet :location_styles

    def will_present
      layout(view, :main_view) do
        subview UILabel,     :name,      text: 'Seaport World Trade Center'
        subview UIButton,    :map,       title: 'Map of 200 Seaport Blvd Boston, MA 02210'
        subview UIImageView, :photo,     image: UIImage.imageNamed('seaport.jpg')
        subview UIButton,    :book_room, title: 'Book a Room'
      end
    end
  end
end
