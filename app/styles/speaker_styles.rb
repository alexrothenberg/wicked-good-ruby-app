Teacup::Stylesheet.new :speaker_styles do

  style UILabel,
    backgroundColor: UIColor.whiteColor

  style :main_view,
    backgroundColor: BW.rgb_color(49, 65, 75)

  style :scrolly,
    backgroundColor: UIColor.clearColor,
    frame: [[8,0], [304, "100%"]]

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
    frame: [[0,0], [320, 320]]

  style :links,
    frame: [[0,300], ["100%", 44]],
    backgroundColor: UIColor.clearColor

  style :link_1,
    frame: [[0,0], [44, 44]]

  style :link_2,
    frame: [[52,0], [44, 44]]

  style :link_3,
    frame: [[104,0], [44, 44]]

  style :about,
    frame: [[8,344], ["100%", 22]]

  style :title,
    frame: [[0,0], ["100%", 22]],
    font: UIFont.boldSystemFontOfSize(16)

  style :body,
    frame: [[0,22], ["100%", 22]]

end
