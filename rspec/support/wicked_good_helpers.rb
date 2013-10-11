module WickedGoodHelpers
  def all_visible_text
    query("view", :text).join(' ')
  end

  def speaker_photo(speaker)
    query "view marked:'#{speaker} photo'"
  end

  def link(link_type)
    query "view marked:'#{link_type} link'"
  end

  def touch_view(name)
    touch("view marked:'#{name}'")
    sleep(STEP_PAUSE)
  end

  def swipe_up
    scroll("scrollView index:0", :down)
    sleep 1
  end
end
