require 'rails_helper'

describe 'When I send a GET request to /api/v1/items' do
  it 'returns a json response of 200 ok containing all items' do
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')

    get "/api/v1/items"

    json = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    expect(response).to be_successful
    expect(json[0][:name]).to eq("Chicken and Waffles")
    expect(json[0][:description]).to eq("we're talin chicken and waffles")
    expect(json[0][:image_url]).to eq('http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
  end
end