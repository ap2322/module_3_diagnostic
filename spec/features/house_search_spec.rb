require 'rails_helper'

describe 'As a user on the / when I select Griffindor and search' do
  it 'returns those house members and displays their info on /search' do
    visit '/'
    select "Gryffindor"
    click_button 'Search For Members'

    expect(current_path).to eq('/search')
    expect(first('.name').text).to_not be_empty
    expect(first('.house').text).to_not be_empty
    expect(page).to have_css('.role')
    expect(page).to have_css('.patronus')
  end
end

# User Story:
# As a user,
# When I visit "/"
# And I Select "Gryffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see a total of the number of members for that house. (21 for Gryffindor)
# Then I should see a list of 21 members
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
