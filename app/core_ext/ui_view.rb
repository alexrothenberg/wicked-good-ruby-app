class UIView
  def top
    frame.origin.y
  end
  def left
    frame.origin.x
  end
  def height
    frame.size.height
  end
  def width
    frame.size.width
  end
  def bottom
    top + height
  end
  def right
    left + width
  end
end
