class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items, status: 200
  end
end

redirect_to controller: 'games', action: 'show', status: "201 Created" if play.save