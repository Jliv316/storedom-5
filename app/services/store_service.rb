class StoreService
  def initialize(zip, radius)
    @zip = zip
    @radius = radius
  end

  def data
    binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
  end
  

 private
 attr_reader :zip, :radius

  def response
    conn = Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "/v1/stores(area(#{zip_code},#{radius}))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=tq72hpvtbbd4mue6f23kmsw2"
    end
  end
end