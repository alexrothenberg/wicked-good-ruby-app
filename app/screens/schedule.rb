module Screen
  class Schedule < PM::GroupedTableScreen
    title 'Schedule'

    stylesheet :schedule_styles
    include Teacup::TableViewDelegate

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

    def visit_speaker(args={})
      speaker_screen = Speaker.new
      speaker_screen.speaker = args[:speaker]
      open speaker_screen
    end

  end
end