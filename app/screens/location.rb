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
        @scroll_view = subview(UIScrollView, :scrolly, showsVerticalScrollIndicator: false) do
          @location_view = text_and_button('Conference Location', location_text, 'http://seaportboston.com') do
            App.open_url 'http://seaportboston.com'
          end
          @book_room_view = text_and_button('Hotel', book_room_text, 'Book a Room at special rate') do
            App.open_url 'https://book.b4checkin.com/seaportboston/rlpv2/NegotiatedRates.asp?TID=DOCK13&CompanyName=Wicked%20Good%20Ruby%20Conference&Category=Group'
          end
        end
      end

    end

    def text_and_button(title, text, button_label)
      body_view = nil   # for scoping
      button_view = nil # for scoping

      view = subview(UIView, :section) do
        subview UILabel, :title, text: title
        body_view = subview UILabel, :body, text: text, numberOfLines: 0
        button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
        button_view = subview(button, :button, title: button_label)
        button_view.when(UIControlEventTouchUpInside) do
          yield
        end
      end
    end

    def will_appear
      super
      map.height = MAP_HEIGHT

      layout_section @location_view, map.bottom - TOP_BELOW_MM_NAV
      layout_section @book_room_view, @location_view.bottom + MARGIN

      @scroll_view.contentSize = [@scroll_view.width, @book_room_view.bottom + 44]
    end

    def layout_section(section_view, top=0)
      title_view, body_view, button_view = section_view.subviews

      body_view.sizeToFit
      button_view.top = body_view.bottom + 22

      section_view.top = top
      section_view.height = button_view.bottom + 22
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

    def location_text
<<-TEXT
Wicked Good Ruby Conf is going to be held at the Seaport Hotel & World Trade Center in Boston.

200 Seaport Blvd Boston, MA 02210
TEXT
    end

    def book_room_text
      "We recommend staying at their hotel if you are coming from out of town. We have reserved a number of single and double rooms for conference attendees."
    end

    def load_url
      App.open_url 'http://maps.apple.com/?ll=42.351016,-71.040786&spn=0.01&q=44+Commonwealth+Pier+Boston%2C+MA+02210'
    end
  end
end
