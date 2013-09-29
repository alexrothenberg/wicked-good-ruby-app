Teacup::Stylesheet.new :location_styles do

  style :main_view,
    backgroundColor: BW.rgb_color(49, 65, 75)

  MAP_HEIGHT=320
  style :scrolly,
    backgroundColor: UIColor.clearColor,
    frame: [[MARGIN,TOP_BELOW_MM_NAV], ["100% - 16", "100% - #{TOP_BELOW_MM_NAV}"]]

  style :section,
    frame: [[0,0], ["100%", "100%"]],
    backgroundColor: UIColor.whiteColor

  style :title,
    frame: [[MARGIN,MARGIN], ["100% - #{MARGIN*2}", TITLE_HEIGHT]],
    textColor: BW.rgb_color(124, 151, 169),
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(24)

  style :body,
    frame: [[MARGIN,TITLE_BOTTOM], ["100% - #{MARGIN*2}", "100%"]]

  style :button,
    frame: [[MARGIN,0], ["100% - #{MARGIN*2}", 30]]

end
