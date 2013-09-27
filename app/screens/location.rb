module Screen
  class Location < PM::MapScreen
    def will_appear
      mm_drawerController.title = 'Location'
    end

    # start_position latitude: 42.351016, longitude: -71.040786, radius: 1
    start_position latitude: 42.350284, longitude: -71.048026, radius: 1

    stylesheet :location_styles

    def screen_setup
      super

      layout(view, :main_view) do
        @copy = subview(UILabel, :copy, text: caption, numberOfLines: 0)
        @links = subview(UIView, :links) do
          subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :hotel,       title: 'http://seaportboston.com').when(UIControlEventTouchUpInside) do
            App.open_url 'http://seaportboston.com'
          end

          subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :book_room, title: 'Book a Room at special rate').when(UIControlEventTouchUpInside) do
            App.open_url 'https://book.b4checkin.com/seaportboston/rlpv2/NegotiatedRates.asp?TID=DOCK13&CompanyName=Wicked%20Good%20Ruby%20Conference&Category=Group'
          end
        end
      end
      map.height = view.height - 190
      @copy.top = map.bottom
      @copy.height = 190
      @copy.sizeToFit
      @links.top = @copy.bottom
    end

    def annotation_data
      @data ||= [{
          latitude: 42.351016,
          longitude: -71.040786,
          title: "Seaport World Trade Center",
          subtitle: "Wicked Good Ruby Here"
        },
        {
          latitude: 42.3522716,
          longitude: -71.055242,
          title: "South Station",
          subtitle: "Trains"
        }
      ]
    end

    def caption
"Wicked Good Ruby Conf is going to be held at the Seaport Hotel & World Trade Center in Boston.

We recommend staying at their hotel if you are coming from out of town. We have reserved a number of single and double rooms for conference attendees."
    end

    def load_url
      App.open_url 'http://maps.apple.com/?ll=42.351016,-71.040786&spn=0.01&q=44+Commonwealth+Pier+Boston%2C+MA+02210'
    end
  end
end
