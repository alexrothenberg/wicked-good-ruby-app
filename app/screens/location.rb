module Screen
  class Location < PM::Screen
    def will_appear
      mm_drawerController.title = 'Location'
    end

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
