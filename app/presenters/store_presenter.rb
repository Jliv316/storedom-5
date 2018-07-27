class StorePresenter
  attr_reader :zip, :radius
  def initialize(zip, radius = 25)
    @zip = zip
    @radius = radius
  end

  def store_data
    json = StoreService.new(zip, radius).data
    store_info = json
    stores = store_info.map do |info|
      Store.new(info, json)
    end
    return stores
  end
end