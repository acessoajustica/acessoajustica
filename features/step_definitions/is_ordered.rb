#Then /^the "(.*?)" select should be sorted$/ do |label, negate|
Then /^the list should be sorted by "(.*?)"$/ do |label|
  select = page.all(:css, '.' + label)
  #options = select.all('option').reject { |o| o.value.nil? }

  select.collect(&:text).each_cons(2) do |a,b|
    (a.downcase <=> b.downcase).should <= 0
  end
end
