module Screen
  class Menu < PM::TableScreen
    stylesheet :menu_styles

    def table_data
      [{
        cells: [
          { title: "Schedule",   action: :show_screen, arguments: { screen_name: :schedule_screen   }},
          { title: "Location",   action: :show_screen, arguments: { screen_name: :location_screen   }},
          { title: "Sponsors",   action: :show_screen, arguments: { screen_name: :sponsors_screen   }},
          { title: "Organizers", action: :show_screen, arguments: { screen_name: :organizers_screen }}
        ]
      }]
    end

    def root_screen
      mm_drawerController
    end

    def will_appear
      # move down for nav menu
      table_view.top = TOP_BELOW_MM_NAV
      table_view.height = table_view.superview.height - TOP_BELOW_MM_NAV
    end

    def show_screen(args)
      screen = root_screen.send(args[:screen_name])
      root_screen.centerViewController = screen
      root_screen.toggleDrawerSide MMDrawerSideLeft, animated:true, completion: nil
    end

    def will_appear
      footer = UIView.alloc.initWithFrame [[0,table_view.height-176],[table_view.width, table_view.height-176]]

      # make blank rows at the bottom not appear
      table_view.tableFooterView = footer
      layout(UIView, :footer) do |footer|
        table_view.tableFooterView = footer
        @name = subview(UILabel, :name, text: "App made by Alex Rothenberg")
        @link_view = subview UIImageView, :link, image: UIImage.imageNamed("website.png")
        @link_view.when_tapped do
          App.open_url 'http://alexrothenberg.com'
        end
      end
      @name.top = footer.height - 30
      @link_view.top = footer.height - 30
    end

  end
end
