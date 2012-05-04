When /^I visit "([^"]*)"$/ do |path|
  visit path
end

When /^I click on "([^"]*)"$/ do |link_name|
  click_on link_name
end

Then /^I should be on "([^"]*)"$/ do |path|
  current_path.should eq(path)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end

