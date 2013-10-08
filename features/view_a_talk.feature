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