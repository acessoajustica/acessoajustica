Given(/^I am on "([^"]*)"$/) do |page_name|
  visit path_to(page_name)
end

And(/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When (/^I press "([^\"]*)"$/) do |button|
  click_button(button)
end

Then (/^I should be on "([^\"]*)"$/) do |page_name|
  current_path.should == path_to(page_name)
end