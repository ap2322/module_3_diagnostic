require 'rails_helper'

describe 'HarryPotterService makes successful api calls' do
  it 'can initialize a connection' do
    call = HarryPotterService.new
    expect(call).to be_a(HarryPotterService)
  end

  scenario 'makes an api call to /characters with query params house and order of the phoenix' do
    VCR.use_cassette('harry_potter_service') do
      call = HarryPotterService.new
      house = 'Gryffindor'

      members = call.find_order_member(house)
      number_of_members = members.length
      expect(number_of_members).to eq 21
      expect(members[1]).to have_key :name
      expect(members[1]).to have_key :role
      expect(members[1]).to have_key :house
      expect(members[1]).to have_key :patronus
    end
  end
end
