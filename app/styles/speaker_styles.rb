Teacup::Stylesheet.new :speaker_styles do

  style UILabel,
    backgroundColor: UIColor.whiteColor

  style :photo,
    frame: [[0,0], [320, 320]]

  style :name,
    frame: [[0,300], ["100%", 22]]

  style :links,
    frame: [[0,322], ["100%", 22]]

  style :link,
    width: "22",
    height: "22"

  style :about,
    frame: [[0,344], ["100%", 22]]

  style :talk_title,
    frame: [[0,364], ["100%", 22]],
    font: UIFont.boldSystemFontOfSize(14)


  style :talk_abstract,
    frame: [[0,384], ["100%", 22]]

end
