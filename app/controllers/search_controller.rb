class SearchController < ApplicationController
  def index
    @stores = StorePresenter.new(params[:zip]).stores
  end
end