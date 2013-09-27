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

    def show_screen(args)
      screen = root_screen.send(args[:screen_name])
      root_screen.centerViewController = screen
      root_screen.toggleDrawerSide MMDrawerSideLeft, animated:true, completion: nil
    end

    def will_appear
      # make blank rows at the bottom not appear
      table_view.tableFooterView = UIView.alloc.initWithFrame CGRectZero
    end

  end
end
