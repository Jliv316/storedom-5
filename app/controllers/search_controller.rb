class SearchController < ApplicationController
  def index
    @stores = StorePresenter.new(params[:zip_code]).stores
  end
end