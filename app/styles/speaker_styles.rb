Teacup::Stylesheet.new :speaker_styles do

  style UILabel,
    backgroundColor: UIColor.whiteColor

  style :main_view,
    backgroundColor: UIColor.whiteColor

  style :scrolly,
    frame: [[0,0], ["100%", "100%"]]

  style :photo,
    frame: [[0,0], [320, 320]]

  style :links,
    frame: [[0,300], ["100%", 22]],
    backgroundColor: UIColor.clearColor

  style :link_1,
    frame: [[0,0], [22, 22]]

  style :link_2,
    frame: [[30,0], [22, 22]]

  style :link_3,
    frame: [[60,0], [22, 22]]

  style :about,
    frame: [[8,344], ["100%", 22]]

  style :talk_title,
    frame: [[8,375], ["100%", 22]],
    font: UIFont.boldSystemFontOfSize(16)


  style :talk_abstract,
    frame: [[8,397], ["100%", 22]]

end
