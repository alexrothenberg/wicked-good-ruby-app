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
  def top=(new_top)
    self.frame = [[left,     new_top], frame.size]
  end
  def left=(new_left)
    self.frame = [[new_left, top],     frame.size]
  end
  def height=(new_height)
    self.frame = [frame.origin,        [width,     new_height]]
  end
  def width=(new_width)
    self.frame = [frame.origin,        [new_width, height]]
  end
end
