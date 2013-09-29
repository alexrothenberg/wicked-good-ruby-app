Teacup::Stylesheet.new :location_styles do

  style :content,
    backgroundColor: UIColor.whiteColor,
    frame: [[0,0], ["100%", 190]]

  style :title,
    frame: [[0, 0], ["100%", TITLE_HEIGHT]],
    textColor: BW.rgb_color(124, 151, 169),
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(20)

  style :location,
    textAlignment: NSTextAlignmentCenter,
    frame: [[HORIZ_MARGIN, 33], ["100% - #{HORIZ_MARGIN*2}", 22]],
    font: UIFont.systemFontOfSize(14)

  style :hotel_btn,
    backgroundColor: UIColor.whiteColor,
    frame: [[40,63], [240, 33]]

  style :book_room_btn,
    backgroundColor: UIColor.whiteColor,
    frame: [[40,104], [240, 33]]

end
