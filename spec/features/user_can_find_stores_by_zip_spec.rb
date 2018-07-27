require 'rails_helper'

describe "User can visit root page" do
  context "And I fill in a search box with 80202 and click search" do
    it "Then my current path should be /search (ignoring params) and has all attributes city, name, distance, phone number, store type" do
      json_response = File.open("./fixtures/stores_by_zip.json")
      url = "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&pageSize=14&apiKey=tq72hpvtbbd4mue6f23kmsw2"
      
      stub_request(:get, url).to_return(status: 200, body: json_response)
      
      visit(root_path)

      fill_in id="zip", with: 80202
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("14 total stores")
      expect(page).to have_content("Name: Belmar")
      expect(page).to have_content("City: Lakewood")
      expect(page).to have_content("Distance: 5.31")
      expect(page).to have_content("Phone Number: 303-742-8039")
      expect(page).to have_content("Store Type: Big Box")
    end

    it "should only display 10 of the 14 on the first page" do
      json_response = File.open("./fixtures/stores_by_zip.json")
      url = "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&pageSize=14&apiKey=tq72hpvtbbd4mue6f23kmsw2"
      
      stub_request(:get, url).to_return(status: 200, body: json_response)
      
      visit(root_path)

      fill_in id="zip", with: 80202
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("10 of 14 stores displayed")
    end

    it "should see pagination links" do
      json_response = File.open("./fixtures/stores_by_zip.json")
      url = "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&pageSize=14&apiKey=tq72hpvtbbd4mue6f23kmsw2"
      
      stub_request(:get, url).to_return(status: 200, body: json_response)
      
      visit(root_path)

      fill_in id="zip", with: 80202
      click_on "Search"

      expect(current_path).to eq("/search")
      expect(page).to have_content("10 of 14 stores displayed")

      click_on '2'

      expect(page).to have_content("4 of 14 stores displayed")
    end
  end
end