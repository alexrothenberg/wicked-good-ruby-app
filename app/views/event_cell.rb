class EventCell < PM::TableViewCell
  attr_accessor :event


  TALK_ROW_HEIGHT = 44
  def setup(data_cell, screen)
    super

    # start = Time.now
    contentView.subviews.each &:removeFromSuperview
    contentView.backgroundColor = UIColor.whiteColor

    time = UILabel.alloc.initWithFrame [[HORIZ_MARGIN, 0], [50, TALK_ROW_HEIGHT]]
    time.text = event.time
    time.font = UIFont.systemFontOfSize(10)
    contentView.addSubview time

    event.talks.each_with_index do |talk, index|
      top = (index == 0) ? 0 : TALK_ROW_HEIGHT + 8
      width = contentView.width - 55
      talk_view = UIView.alloc.initWithFrame [[40, top], [width, TALK_ROW_HEIGHT]]
      contentView.addSubview talk_view

      if talk.speaker_id
        ruby_image = UIImageView.alloc.initWithFrame [[0, (TALK_ROW_HEIGHT/2) - 5], [10, 10]]
        ruby_image.image = self.class.ruby_image
        talk_view.addSubview ruby_image
      end

      title = UILabel.alloc.initWithFrame [[14, 0], [talk_view.width-70, talk_view.height]]
      title.text = talk.title
      title.numberOfLines = 0
      title.font = UIFont.boldSystemFontOfSize(10)
      talk_view.addSubview title

      location = UILabel.alloc.initWithFrame [[title.right + 5, 0], [65, talk_view.height]]
      location.font = UIFont.systemFontOfSize(10)
      location.text = talk.location
      location.numberOfLines = 0
      talk_view.addSubview location

      if talk.speaker_id
        talk_view.when_tapped do
          speaker_screen = Screen::Speaker.new
          speaker_screen.speaker = talk.speaker
          screen.open speaker_screen
        end
      end
    end

    # stop = Time.now
    # NSLog "#{stop-start}: #{event.time}"
  end

  def self.ruby_image
    @ruby_image ||= UIImage.imageNamed 'ruby.png'
  end
end
