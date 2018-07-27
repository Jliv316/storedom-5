require 'rails_helper'

describe 'When I send a GET request to /api/v1/items' do
  it 'returns a json response of 200 ok containing all items' do
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
    Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')

    get "/api/v1/items"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[0][:name]).to eq("Chicken and Waffles")
    expect(json[0][:description]).to eq("we're talin chicken and waffles")
    expect(json[0][:image_url]).to eq('http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
  end
end

describe 'When I send a GET request to /api/v1/items/:id' do
  it 'returns a json response of 200 ok containing the item and its attributes (minus created_at and updated_at' do
    item = Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:name]).to eq("Chicken and Waffles")
    expect(json[:description]).to eq("we're talin chicken and waffles")
    expect(json[:image_url]).to eq('http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')
  end
end

describe 'When I send a DELETE request to /api/v1/items/:id' do
  it 'returns a json response of 204 IF the item is successfully deleted' do
    item = Item.create(name: "Chicken and Waffles", description: "we're talin chicken and waffles", image_url: 'http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200')

    delete "/api/v1/items/#{item.id}"

    expect(response).to have_http_status(204)
  end
end

describe 'When I send a POST request to /api/v1/items' do
  describe 'I receive a 201 JSON  response if the record is successfully created' do
    it 'I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at' do
      name = "test"
      description = "fantastic"
      image_url = 'http://localhost:3001/test.url'

      post "/api/v1/items?name=#{name}&description=#{description}&image_url=#{image_url}"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(json[:name]).to eq(name)
      expect(json[:description]).to eq(description)
      expect(json[:image_url]).to eq('http://localhost:3001/test.url')
    end
  end
end

