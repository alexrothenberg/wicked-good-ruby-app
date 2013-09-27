Teacup::Stylesheet.new :menu_styles do

  style :main_view,
    backgroundColor: UIColor.whiteColor

  style :Location,
    frame: [[8,8], ["100%", 22]]

  style :Sponsors,
    frame: [[8,38], ["100%", 22]]

  style :Organization,
    frame: [[8,68], ["100%", 22]]

  style :footer,
    frame: [[0,176], ["100%", "100% - 176"]]

  style :name,
    frame: [[30,300-TOP_BELOW_MM_NAV], ["100% - 22", 22]],
    backgroundColor: UIColor.whiteColor,
    font: UIFont.boldSystemFontOfSize(12)

  style :link,
    frame: [[8,300-TOP_BELOW_MM_NAV], [22, 22]],
    backgroundColor: UIColor.whiteColor

end
