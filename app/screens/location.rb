module Screen
  class Location < PM::MapScreen
    title 'Location'
    def will_appear
      mm_drawerController.title = title
    end

    # start_position latitude: 42.351016, longitude: -71.040786, radius: 1
    start_position latitude: 42.351016, longitude: -71.048026, radius: 1

    stylesheet :location_styles

    def screen_setup
      super

      layout(view, :main_view) do
        @content = subview(UIView, :content) do
          @title = subview(UILabel, :title, text: 'Seaport World Trade Center', numberOfLines: 0)
          @location = subview(UILabel, :location, text: '200 Seaport Blvd Boston, MA 02210', numberOfLines: 0)
          @location_btn = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :hotel_btn,       title: 'http://seaportboston.com')
          @book_room_btn = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :book_room_btn, title: 'Book a Room at special rate')
        end
      end

      @location_btn.when_tapped do
        App.open_url 'http://seaportboston.com'
      end
      @book_room_btn.when_tapped do
        App.open_url 'https://book.b4checkin.com/seaportboston/rlpv2/NegotiatedRates.asp?TID=DOCK13&CompanyName=Wicked%20Good%20Ruby%20Conference&Category=Group'
      end
    end

    def will_appear
      @content.height = @book_room_btn.bottom + 16

      map.height = view.height - @content.height
      @content.top = map.bottom
    end

    def annotation_data
      @data ||= [{
          latitude: 42.351016,
          longitude: -71.040786,
          title: "Seaport World Trade Center",
          subtitle: "Wicked Good Ruby Conf Here"
        },
        {
          latitude: 42.3522716,
          longitude: -71.055242,
          title: "South Station",
          subtitle: "Trains"
        }
      ]
    end

    def location_text
<<-TEXT
Seaport Hotel & World Trade Center
200 Seaport Blvd Boston, MA 02210
TEXT
    end

    def book_room_text
      "We recommend staying at their hotel if you are coming from out of town."
    end

  end
end
