Teacup::Stylesheet.new :location_styles do

  style :name,
    frame: [[0,0], ["100%", 22]],
    font: UIFont.boldSystemFontOfSize(14)

  style :address,
    frame: [[0,200], ["100%", 22]]

  style :map_button,
    frame: [[0,230], ["100%", 22]],
    type: UIButtonTypeRoundedRect

  style :photo,
    frame: [[0,44], [307, 142]]

  style :book_room,
    frame: [[0,186], ["100%", 22]]

end
