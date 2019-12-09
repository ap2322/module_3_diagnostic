require 'rails_helper'

describe 'As a user on the / when I select Griffindor and search' do
  it 'returns those house members and displays their info on /search' do
    visit '/'
    select "Griffindor", :from => "options_for_select(hogwarts_houses)"
    click_button 'Search For Members'

    expect(current_path).to eq('/search')

    # find capybara/rspec expectaions for number of css elements on a page
    within ".members" do
      expect(page).to have_css('name')
      expect(page).to have_css('role')
      expect(page).to have_css('house')
      expect(page).to have_css('patronus')
    end
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
