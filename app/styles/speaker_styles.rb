Teacup::Stylesheet.new :speaker_styles do

  style UILabel,
    backgroundColor: UIColor.whiteColor

  style :main_view,
    backgroundColor: BW.rgb_color(49, 65, 75)

  style :scrolly,
    backgroundColor: UIColor.clearColor,
    frame: [[HORIZ_MARGIN,TOP_BELOW_MM_NAV], ["100% - #{HORIZ_MARGIN*2}", "100%"]]

  style :about_section,
    backgroundColor: UIColor.whiteColor,
    top: 320,
    width: '100%',
    height: '100%'

  style :talk_section,
    backgroundColor: UIColor.whiteColor,
    width: '100%',
    height: '100%'

  style :photo,
    frame: [[0,TOP_BELOW_MM_NAV], [320, 320]]

  style :links,
    frame: [[0,300], ["100%", 44]],
    backgroundColor: UIColor.clearColor

  style :link_1,
    frame: [[0,0], [44, 44]]

  style :link_2,
    frame: [[52,0], [44, 44]]

  style :link_3,
    frame: [[104,0], [44, 44]]

  style :title,
    frame: [[BIG_HORIZ_MARGIN, VERTICAL_MARGIN], ["100% - #{BIG_HORIZ_MARGIN*2}", TITLE_HEIGHT]],
    textColor: BW.rgb_color(124, 151, 169),
    textAlignment: NSTextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(24)

  style :body,
    frame: [[BIG_HORIZ_MARGIN,TITLE_BOTTOM], ["100% - #{BIG_HORIZ_MARGIN*2}", 22]]

end
