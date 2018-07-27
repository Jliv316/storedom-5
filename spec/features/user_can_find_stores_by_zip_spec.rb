require 'rails_helper'

describe "User can visit root page" do
  context "And I fill in a search box with 80202 and click search" do
    context "Then my current path should be /search (ignoring params)" do
      json_response = File.open("./fixtures/stores_by_zip.json")
      url = "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=tq72hpvtbbd4mue6f23kmsw2"
      
      stub_request(:get, url).to_return(status: 200, body: json_response)
      
      visit(root_path)

      fill_in id="zip", with: 80202
      click_on "Search"

      expect(current_path).to be("/search")
      expect(page).to have_content("14 Total Stores")
      expect(page).to have_content("BELMAR CO")
      expect(page).to have_content("COLORADO BLVD CO")
      expect
    end
  end
end