require 'rails_helper'

describe 'HarryPotterService makes successful api calls' do
  it 'makes an api call to /characters with query params house and order of the phoenix' do
    call = HarryPotterService.new
    house = 'Griffindor'

    members = call.find_order_member(house)

    expect(members.count).to eq 21
    expect(members[0]).to have_key :name
    expect(members[0]).to have_key :role
    expect(members[0]).to have_key :house
    expect(members[0]).to have_key :patronus
  end
end
