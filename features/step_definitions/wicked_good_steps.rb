When(/^I swipe upward$/) do
  scroll("scrollView index:0", :down)
  sleep 1
end

Then(/^I should see the text "(.*)"$/) do |text|
  all_visible_text.should include(text)
end

Then(/^I should see the speaker photo for "(.*?)"$/) do |speaker|
  speaker_photo(speaker).should_not be_nil
end

Then(/^I should see a (.*) link$/) do |link_type|
  link(link_type).should_not be_nil
end
