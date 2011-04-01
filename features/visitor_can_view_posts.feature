Feature: A visitor can view posts
  In order to read the blog
  As a visitor
  I want to be able to view posts

  Scenario: View list of posts
    Given a post exists with title: "Cucumber"
    And a post exists with title: "Webrat"
    When I am on list of posts
    Then I should see "Cucumber"
    And I should see "Webrat"

  Scenario: View single post
    Given a post exists with title: "Cucumber"
    And a post exists with title: "Webrat"
    When I am on list of posts
    And I follow "Webrat"
    Then I should see "Webrat"
    And I should not see "Cucumber"

  Scenario: Don't display unpublished posts
    Given a post exists with title: "Cucumber", published_at: nil
    When I am on list of posts
    Then I should not see "Cucumber"

  Scenario: Visitor can see posts grouped by month
    Given a post exists with title: "Cucumber", published_at: "2011-01-03"
    And a post exists with title: "Webrat", published_at: "2011-01-13"
    And a post exists with title: "Vim", published_at: "2011-02-03"
    And I am on list of posts
    Then I should see "January 2011 (2)"
    And I should see "February 2011 (1)"
    And I should see "Cucumber"
    And I should see "Webrat"
    And I should see "Vim"
    When I follow "January 2011"
    Then I should see "Cucumber"
    And I should see "Webrat"
    And I should not see "Vim"

  Scenario: Visitor can filter posts by editor
    Given a editor "editor1" exists with name: "Editor1"
    And a editor "editor2" exists with name: "Editor2"
    And a post exists with title: "Post from Editor 1", editor: editor "editor1"
    And a post exists with title: "Post from Editor 2", editor: editor "editor2"
    And I am on list of posts
    Then I should see "Editors"
    And I should see "Editor1"
    And I should see "Editor2"
    And I should see "Post from Editor 1"
    And I should see "Post from Editor 2"
    When I follow "Editor1"
    Then I should see "Displaying posts from Editor1"
    And I should see "Post from Editor 1"
    And I should not see "Post from Editor 2"
