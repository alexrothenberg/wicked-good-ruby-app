HORIZ_MARGIN     = 8
BIG_HORIZ_MARGIN = HORIZ_MARGIN * 2
VERTICAL_MARGIN  = 8
TITLE_HEIGHT     = 33
TITLE_BOTTOM     = VERTICAL_MARGIN + TITLE_HEIGHT


# HACK: IOS7 + MMDrawerController seems to let you draw behind he nav bar. Use this to move everything down
if Device.ios_version < '7.0'
  TOP_BELOW_MM_NAV = 0
else
  TOP_BELOW_MM_NAV = 65
end