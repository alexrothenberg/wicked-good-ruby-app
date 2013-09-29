Teacup::Stylesheet.new :location_styles do

  style :main_view,
    backgroundColor: BW.rgb_color(49, 65, 75)

  MAP_HEIGHT=320
  style :scrolly,
    backgroundColor: UIColor.clearColor,
    frame: [[HORIZ_MARGIN,TOP_BELOW_MM_NAV], ["100% - #{HORIZ_MARGIN*2}", "100% - #{TOP_BELOW_MM_NAV}"]]

  style :section,
    frame: [[0,0], ["100%", "100%"]],
    backgroundColor: UIColor.whiteColor

  style :title,
    frame: [[HORIZ_MARGIN,VERTICAL_MARGIN], ["100% - #{HORIZ_MARGIN*2}", TITLE_HEIGHT]],
    textColor: BW.rgb_color(124, 151, 169),
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(24)

  style :body,
    frame: [[HORIZ_MARGIN,TITLE_BOTTOM], ["100% - #{HORIZ_MARGIN*2}", "100%"]]

  style :button,
    frame: [[HORIZ_MARGIN,0], ["100% - #{HORIZ_MARGIN*2}", 30]]

end
