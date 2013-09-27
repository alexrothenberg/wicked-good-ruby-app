module Screen
  class Sponsors < PM::GroupedTableScreen
    def will_appear
      mm_drawerController.title = 'Sponsors'
    end

    stylesheet :sponsors_styles
    include Teacup::TableViewDelegate

    def will_appear
      # move down for nav menu
      table_view.frame = [[0, 65], [table_view.width, table_view.height-65]]
    end

    def table_data
      Sponsor.types.map do |type|
        {
          title: type,
          cells: ::Sponsor.all_of(type).map do |sponsor|
            { cell_class: SponsorCell, sponsor: sponsor, height: 50, action: :goto_url, arguments: { url: sponsor.url}}
          end
        }
      end
    end

    def goto_url(url)
      App.open_url url
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