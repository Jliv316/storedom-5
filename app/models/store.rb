class Store
  attr_reader :longName, :city, :distance, :phone, :storeType
  def initialize(info)
    binding.pry
    @longName = info[:longName]
    @city = info[:city]
    @distance = info[:distance]
    @phone = info[:phone]
    @storeType = info[:storeType]
  end
end