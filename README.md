# Wicked Good Ruby App

An iPhone app for the [WickedGoodRuby Conference](http://wickedgoodruby.com/) taking place in Boston Oct 12-13, 2013.

This app is [Freely available in the Apple iOS App Store](https://itunes.apple.com/us/app/wicked-good-ruby-conf/id718424802?mt=8&ign-mpt=uo%3D4).

## Automated Acceptance Testing

In addition to being useful for the conference, this app demonstrates
how to use [calabash](https://github.com/calabash/calabash-ios)
to run automated acceptance tests of an iOS app. 
If you've never heard of it, `Calabash` is a DSL that lets you drive an iOS app
similarly to what Capybara lets you do for web apps.

### If you like cucumber

    rake cucumber

will run

```gherkin
Feature: Learning about a speaker and her talk
  As an attendee of Wicked Good Ruby Conf
  I want to learn about the talks
  So I can decide which ones to attend

Scenario: Learn about Sandi Metz's keynote
   When I touch "Opening Keynote by Sandi Metz"
   Then I should see the speaker photo for "Sandi Metz"
   When I swipe upward
   Then I should see the text "Sandi Metz has thirty years of experience working on projects"
   When I swipe upward
    And I should see a web link
    And I should see a github link
    And I should see a twitter link
```

### If you prefer straight rspec

    rake rspec

will run

```ruby
require_relative "../spec_helper.rb"

describe "Learning about a speaker and her talk" do
  before do
    MotionLauncher.new.relaunch
  end

  it "Learn about Sandi Metz's keynote" do
    touch_view  "Opening Keynote by Sandi Metz"
    speaker_photo('Sandi Metz').should_not be_nil
    swipe_up
    all_visible_text.should include "Sandi Metz has thirty years of experience working on projects"
    swipe_up
    link(:web).should_not be_nil
    link(:github).should_not be_nil
    link(:twitter).should_not be_nil
  end
end
```
