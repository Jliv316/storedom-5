class StorePresenter
  attr_reader :zip, :radius
  def initialize(zip, radius = 25)
    @zip = zip
    @radius = radius
  end

  def stores
    json = StoreService.new(zip, radius).data
    store_info = json[:stores]
    stores = store_info.map do |info|
      Store.new(info)
    end
    return stores
  end
end