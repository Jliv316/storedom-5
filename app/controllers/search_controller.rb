require 'will_paginate/array'
class SearchController < ApplicationController
  def index
  stores = StorePresenter.new(params[:zip]).stores
  @stores = stores.paginate(page: params[:page], per_page: 10)

  @stores_all = stores.count
  end
end