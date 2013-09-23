module Screen
  class Speakers < PM::TableScreen
    title 'Speakers'

    def table_data
      [{
        cells: ::Speaker.all.map do |speaker|
          {
            title: speaker.name,
            image: speaker.photo,
            action: :visit_speaker,
            arguments: { speaker: speaker }
          }
        end
      }]
    end

    def visit_speaker(args={})
      speaker_screen = Speaker.new
      speaker_screen.speaker = args[:speaker]
      open speaker_screen
    end
  end
end