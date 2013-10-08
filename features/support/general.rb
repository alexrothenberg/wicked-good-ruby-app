def all_visible_text
  query("view", :text).join(' ')
end

def speaker_photo(speaker)
  query "view marked:'#{speaker} photo'"
end

def link(link_type)
  query "view marked:'#{link_type} link'"
end