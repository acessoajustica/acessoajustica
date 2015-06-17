def sign_in (user_role)
	user = FactoryGirl.create(:user, user_role + "_user")
	visit path_to('login page')
	fill_in "user_login", :with => user.username
	fill_in "user_password", :with => user.password
	click_button("submit")
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

Given(/^I am logged as "([^"]*)"$/) do |user_role|
  sign_in(user_role)
end

Given(/^I am not authenticated$/) do
end

And(/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When (/^I press "([^\"]*)"$/) do |button|
  click_button(button)
end

When(/^I click on "([^"]*)" link$/) do |link_text|
	click_link link_text
end

When(/^I take "([^"]*)" picture of the page$/) do |text|
  page.save_screenshot("./tmp/" + text.gsub(" ", "_") + "_picture.png")
end

Then (/^I should be on "([^\"]*)"$/) do |page_name|
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

Given(/^exists an? "([^"]*)"$/) do |name|
  entity = create(name)
  entity.save
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
