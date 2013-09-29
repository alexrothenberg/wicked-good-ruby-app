Teacup::Stylesheet.new :organization_styles do

  style :scrolly,
    frame: [[0,0], ["100%", "100%"]]

  style :main_view,
    backgroundColor: UIColor.whiteColor,
    frame: [[0,TOP_BELOW_MM_NAV], ["100%", "100% - #{TOP_BELOW_MM_NAV}"]]

  style :photo,
    frame: [[HORIZ_MARGIN,0], [144, 144]]

  style :name,
    frame: [[HORIZ_MARGIN,136], ["100% - #{HORIZ_MARGIN*2}", 22]],
    backgroundColor: UIColor.whiteColor,
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(12)


end
