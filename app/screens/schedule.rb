module Screen
  class Schedule < PM::GroupedTableScreen
    title 'Schedule'
    def will_appear
      mm_drawerController.title = title
    end

    stylesheet :schedule_styles
    include Teacup::TableViewDelegate

    def will_appear
      # move down for nav menu
      table_view.top = TOP_BELOW_MM_NAV
      table_view.height = table_view.superview.height - TOP_BELOW_MM_NAV
    end

    def table_data
      Event.days.map do |day|
        {
          title: day,
          cells: ::Event.all_on(day).map do |event|
            height = event.talks.size * 45
            { cell_class: EventCell, event: event, height: height }
          end
        }
      end
    end

    def tableView(table_view, viewForHeaderInSection:section)
      UILabel.alloc.init.tap do |view|
        view.backgroundColor = UIColor.clearColor
        view.textColor = BW.rgb_color(239, 69, 67)
        view.textAlignment = NSTextAlignmentCenter
        view.text = section_at_index(section)[:title]
      end
    end

    def visit_speaker(args={})
      speaker_screen = Speaker.new
      speaker_screen.speaker = args[:speaker]
      open speaker_screen
    end

  end
end