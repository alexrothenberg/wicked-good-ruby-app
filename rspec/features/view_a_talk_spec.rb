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
