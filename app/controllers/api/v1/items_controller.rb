class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    render json: @items, status: 200
  end

  def show
    @item = Item.find(params[:id])
    render json: @item, status: 200
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    render body: nil, status: :no_content
  end
end