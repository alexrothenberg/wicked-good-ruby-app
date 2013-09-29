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
        @made_by = subview(UILabel, :made_by, text: "Made by Alex Rothenberg")
        @made_by.when_tapped do
          App.open_url 'http://alexrothenberg.com'
        end
      end
      @made_by.top = footer.height - 30
    end

  end
end
