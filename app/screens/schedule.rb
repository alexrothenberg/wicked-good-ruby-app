module Screen
  class Schedule < PM::GroupedTableScreen
    title 'Schedule'

    def table_data
      [{
        title: 'FRIDAY, OCT. 11',
        cells: ::Event.all_on(:friday).map do |event|
          {
            title: event.title
          }
        end
      },
      {
        title: 'SATURDAY, OCT. 12',
        cells: ::Event.all_on(:saturday).map do |event|
          {
            title: event.title
          }
        end
      },
      {
        title: 'SUNDAY, OCT. 13',
        cells: ::Event.all_on(:sunday).map do |event|
          {
            title: event.title
          }
        end
      }
    ]
    end

    def visit_speaker(args={})
      speaker_screen = Speaker.new
      speaker_screen.speaker = args[:speaker]
      open speaker_screen
    end

  end
end