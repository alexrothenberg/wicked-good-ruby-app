class EventCell < PM::TableViewCell
  attr_accessor :event

  def setup(data_cell, screen)
    super

    start = Time.now
    contentView.subviews.each &:removeFromSuperview
    contentView.backgroundColor = UIColor.whiteColor
    layout(contentView) do
      subview(UILabel, :time, text: event.time)
      event.talks.each_with_index do |talk, index|
        talk_view = subview(UIView, "talk_#{index+1}".to_sym) do
          subview(UILabel, :title,    text: talk.title,    numberOfLines: 0)
          subview(UILabel, :location, text: talk.location, numberOfLines: 0)
        end
        if talk.speaker_id
          talk_view.when_tapped do
            speaker_screen = Screen::Speaker.new
            speaker_screen.speaker = talk.speaker
            screen.open speaker_screen
          end
        end
      end
    end

    stop = Time.now
    puts "#{stop-start}: #{event.time}"
  end

  def time_view
    contentView.subviews.first
  end
  def title_views
    talk_views = contentView.subviews[1..contentView.subviews.size]
    talk_views.map do |talk_view|
      talk_view.subviews.first
    end
  end
end
