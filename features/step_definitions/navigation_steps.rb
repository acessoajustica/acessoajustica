def sign_in (user_role)
  user = bind_user(user_role)
  visit path_to('login')
  fill_in "user_login", :with => user.username
  fill_in "user_password", :with => user.password
  click_button("submit")
end

def bind_user (user_role)
  user_entity = FactoryGirl.create(:user, user_role + "_user")
  membro_entity = FactoryGirl.create(user_role) if user_role != 'admin'
  user_entity.membro_id = membro_entity.actable_id if user_role != 'admin'
  user_entity.save
  user_entity
end

def bind (property, owners_list)
  property_entity = create(property)
  
  owners_list.each do |owner|
    owner_entity = create(owner)
    owner_name = owner.split.last
    property_entity.send("#{owner_name}=", owner_entity)
  end
  
  property_entity
end

def create (factory_names)
  factory_and_traits = factory_names.split(' ')
  factory = factory_and_traits.pop
  traits = factory_and_traits.map! {|trait| trait.to_sym}
  FactoryGirl.create(factory, *traits)
end

Given(/^I am on "([^"]*)"$/) do |page_name|
  visit path_to(page_name)
end

Given(/^I am on "([^"]*)" page$/) do |page_name|
  visit path_to(page_name)
end

Given(/^I am logged as "([^"]*)"$/) do |user_role|
  sign_in(user_role)
end

Given(/^I am not authenticated$/) do
end

And(/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

And(/^I choose "([^\"]*)"$/) do |field|
  choose(field.gsub(' ', '_'))
end

When (/^I press "([^\"]*)"$/) do |button|
  click_button(button)
end

When(/^I click on "([^"]*)" link$/) do |link_text|
  click_link link_text
end

When(/^I select the option "([^"]*)" in "([^"]*)"$/) do |option, select|
  find(:select, select.gsub(' ', '_')).first(:option, option).select_option
  # select(option, :from => select.gsub(' ', '_'))
end

When(/^I choose the option "([^"]*)" in "([^"]*)"$/) do |option, select|
  choose(select.gsub(' ', '_'), option: option)
end

When(/^I take "([^"]*)" picture of the page$/) do |text|
  page.save_screenshot("./tmp/" + text.gsub(" ", "_") + "_picture.png")
end

Then (/^I should be on "homepage"$/) do
  current_path.should == path_to('homepage')
end

Then (/^I should be on "([^\"]*)" page$/) do |page_name|
  current_path.should == path_to(page_name)
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "([^"]*)"$/) do |text|
  page.should have_no_content(text)
end

Given(/^exists an? "([^"]*)" that belongs to an? "([^"]*)"$/) do |property, owners|
  owners_list = owners.split(/, to an? | and to an? /)
  property_entity = bind(property, owners_list)
  property_entity.save
end

Given(/^exists an? "([^"]*)"$/) do |entity|
  create(entity).save
end

When(/^I click at css "([^"]*)"$/) do |arg1|
  find(:css, arg1).trigger("click")
end

When(/^I wait a second$/) do
  sleep 1
end

Then(/^I should see the pattern "([^"]*)"$/) do |arg1|
  page.text.should match(arg1)
end

When /^I dump.* the response$/ do
  puts body
end
