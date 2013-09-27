Teacup::Stylesheet.new :organization_styles do

  style :main_view,
    backgroundColor: UIColor.whiteColor,
    frame: [[0,65], ["100%", "100%"]]

  style :photo,
    frame: [[8,0], [144, 144]]

  style :name,
    frame: [[22,136], ["100% - 22", 22]],
    backgroundColor: UIColor.whiteColor,
    textAlignment: NSTextAlignmentCenter

  style :link,
    frame: [[0,136], [22, 22]],
    backgroundColor: UIColor.whiteColor

end
