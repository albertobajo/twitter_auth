When /^I visit "([^"]*)"$/ do |path|
  visit path
end

Then /^I should be on "([^"]*)"$/ do |path|
  page.current_path == path
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
