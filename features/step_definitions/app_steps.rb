Given /^I am logged in as "([^\"]*)"$/ do |email|
  steps %Q{
    Given I am on the login page
    When I fill in "Email" with "#{email}"
    And I fill in "Password" with "password"
    And I press "Login"
  }
end

Given /^I am logged in as editor$/ do
  Factory.create(:editor, :email => "editor@example.com")
  steps %Q{
    Given I am logged in as "editor@example.com"
  }
end

Given /^I am logged in as admin$/ do
  Factory.create(:admin, :email => "admin@example.com")
  steps %Q{
    Given I am logged in as "admin@example.com"
  }
end

Given /^I have posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Factory.create(:post, :title => title)
  end
end

Then /^should see a comment form$/ do
  response.should have_selector("form#new_comment")
#  response.should field_element("comment[email]")
  response.should have_xpath(".//input[@name = 'comment[name]']" )
  response.should have_xpath(".//input[@name = 'comment[email]']" )
  response.should have_xpath(".//textarea[@name = 'comment[content]']" )
  response.should have_xpath(".//input[@name = 'commit' and @type = 'submit' and @value = 'Comment']" )
end

When /^I fill in the comment name "([^\"]*)"$/ do |name|
  fill_in "Name", :with => name
end

When /^I fill in the comment email "([^\"]*)"$/ do |email|
  fill_in "Email", :with => email
end

When /^I fill in the comment url "([^\"]*)"$/ do |url|
  fill_in "URL", :with => url
end

Then /^the page should have "([^"]*)"$/ do |selector|
  page.should have_css(selector)
end

Then /^the page should not have "([^"]*)"$/ do |selector|
  page.should_not have_css(selector)
end
