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

Given (/^I am editing a caso$/) do
  property_entity = bind('caso', ['cliente'])
  property_entity.save
  visit path_to('edit caso ' + property_entity.id.to_s)
end