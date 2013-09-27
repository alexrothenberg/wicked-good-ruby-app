Teacup::Stylesheet.new :schedule_styles do

  style :main_view,
    frame: [[0,65], ["100%", "100%"]]

  style UILabel,
    backgroundColor: UIColor.whiteColor,
    font: UIFont.systemFontOfSize(10)

  style :day_selector,
    constraints: [
      :top_left,
      :full_width,
      constrain_height(44)
    ]

  TALK_ROW_HEIGHT = 44
  style :talks_table,
    constraints: [
      constrain_left(0),
      :full_width,
      constrain(:height).equals(:superview, :height),
      constrain_below(:day_selector)
    ]

  style :time,
    constraints: [
      constrain_top(0),
      constrain_left(8),
      constrain_width(50),
      constrain_height(TALK_ROW_HEIGHT)
    ]

  style :talk_1,
    constraints: [
      constrain_top(0),
      constrain_left(55),
      constrain(:width).equals(:superview, :width).minus(60),
      constrain_height(TALK_ROW_HEIGHT)
    ]

  style :talk_2,
    constraints: [
      constrain_left(55),
      constrain(:width).equals(:superview, :width).minus(60),
      constrain_height(TALK_ROW_HEIGHT),
      constrain_below(:talk_1)
    ]

  style :title,
  font: UIFont.boldSystemFontOfSize(10),
    constraints: [
      :top_left,
      constrain(:width).equals(:superview, :width).minus(65),
      :full_height
    ]

  style :location,
    constraints: [
      :top_right,
      constrain_width(65),
      :full_height
    ]

  style :ruby_image,
    constraints: [
      constrain(:self, :center_y).equals(:title, :center_y),
      constrain_to_left(:title).minus(4),
      constrain_height(10),
      constrain_width(10)
    ]


end
