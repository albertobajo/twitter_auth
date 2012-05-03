When /^I visit "([^"]*)"$/ do |path|
  visit path
end

Then /^I should be on "([^"]*)"$/ do |path|
  current_path.should eq(path)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
