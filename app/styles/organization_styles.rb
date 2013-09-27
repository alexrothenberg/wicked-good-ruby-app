Teacup::Stylesheet.new :organization_styles do

  style :scrolly,
    frame: [[0,0], ["100%", "100%"]]

  style :main_view,
    backgroundColor: UIColor.whiteColor,
    frame: [[0,TOP_BELOW_MM_NAV], ["100%", "100% - #{TOP_BELOW_MM_NAV}"]]

  style :photo,
    frame: [[8,0], [144, 144]]

  style :name,
    frame: [[22,136], ["100% - 22", 22]],
    backgroundColor: UIColor.whiteColor,
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(12)

  style :link,
    frame: [[8,136], [22, 22]],
    backgroundColor: UIColor.whiteColor

end
