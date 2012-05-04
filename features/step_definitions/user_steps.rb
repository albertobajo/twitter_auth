Given /^I am not authenticated$/ do
  step %(I visit "/")
  step %(I click on "Sign out")
end

Given /^I am authenticated$/ do
  step %(I visit "/twitter_auth/session/new")
  step %(I should be on "/")
  step %(I should see user info)
end

Then /^I should see user info$/ do
  step %(I should see "Matt Harris")
  step %(I should see "Going through and updating @twitterapi documentation")
  step %(I should see "themattharris")
end

Then /^I should not see user info$/ do
  step %(I should not see "Matt Harris")
  step %(I should not see "Going through and updating @twitterapi documentation")
  step %(I should not see "themattharris")
end
