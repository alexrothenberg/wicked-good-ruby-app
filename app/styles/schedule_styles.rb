Teacup::Stylesheet.new :schedule_styles do

  style :main_view,
    frame: [[0,TOP_BELOW_MM_NAV], ["100%", "100% - #{TOP_BELOW_MM_NAV}"]]

  style UILabel,
    backgroundColor: UIColor.whiteColor,
    font: UIFont.systemFontOfSize(10)

  # For performance event_cell does not use Teacup styles :(
  # TALK_ROW_HEIGHT = 44
  # style :time,
  #   frame: [[HORIZ_MARGIN, 0], [50, TALK_ROW_HEIGHT]]

  # style :talk_1,
  #   frame: [[40, 0], ["100% - 55", TALK_ROW_HEIGHT]]

  # style :talk_2,
  #   frame: [[40, TALK_ROW_HEIGHT + 8], ["100% - 65", TALK_ROW_HEIGHT]]

  # style :ruby_image,
  #   frame: [[0, (TALK_ROW_HEIGHT/2) - 5], [10, 10]]

  # style :title,
  #   font: UIFont.boldSystemFontOfSize(10),
  #   frame: [[14, 0], ["100% - 70", "100%"]]

  # style :location,
  #   frame: [[200, 0], [65, "100%"]]


end
