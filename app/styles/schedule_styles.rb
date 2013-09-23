Teacup::Stylesheet.new :schedule_styles do

  style UILabel,
    backgroundColor: UIColor.whiteColor,
    font: UIFont.systemFontOfSize(10)

  style :day_selector,
    constraints: [
      :top_left,
      :full_width,
      constrain_height(44)
    ]

  style :talks_table,
    constraints: [
      constrain_left(0),
      :full_width,
      constrain(:height).equals(:superview, :height),
      constrain_below(:day_selector)
    ]

    style :time,
      constraints: [
        :top_left,
        constrain_width(50),
        :full_height
      ]

    style :talk_1,
      constraints: [
        constrain_top(0),
        constrain_left(50),
        constrain(:width).equals(:superview, :width).minus(60),
        constrain_height(50)
      ]

    style :talk_2,
      constraints: [
        constrain_left(50),
        constrain(:width).equals(:superview, :width).minus(60),
        constrain_height(50),
        constrain_below(:talk_1)
      ]

    style :title,
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



end
