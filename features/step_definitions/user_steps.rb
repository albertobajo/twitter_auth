Given /^I am not authenticated$/ do
end

Then /^I should see user info$/ do
  step %(I should see "Matt Harris")
  step %(I should see "Going through and updating @twitterapi documentation")
  step %(I should see "themattharris")
end
