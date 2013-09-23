class EventCell < PM::TableViewCell
  attr_accessor :event

  def setup(data_cell, screen)
    super

    layout(contentView) do
      subview(UILabel, :time, text: event.time)
      event.talks.each_with_index do |talk, index|
        subview(UIView, "talk_#{index+1}".to_sym) do
          subview(UILabel, :title,    text: talk[:title])
          subview(UILabel, :location, text: talk[:location])
        end
      end
    end
  end
end
