Teacup::Stylesheet.new :location_styles do

  style :main_view,
    backgroundColor: UIColor.whiteColor

  style :copy,
    frame: [[8,0], ["100% - 16", "100%"]],
    font: UIFont.systemFontOfSize(14),
    backgroundColor: UIColor.whiteColor

  style :links,
    frame: [[8,0], ["100%", 44]]

  style :hotel,
    frame: [[0,0], ["100%", 22]]

  style :book_room,
    frame: [[0,22], ["100%", 22]]

end
