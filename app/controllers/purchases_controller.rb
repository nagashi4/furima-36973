class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_index_sold_out, only: [:index, :create]



  def index
    @purchases_address= PurchasesAddress.new
  end


  def create
    
    @purchases_address=PurchasesAddress.new(purchases_params)
    if @purchases_address.valid?
      @purchases_address.save
      
      redirect_to root_path
    else
      render :index
    end
    
  end

  private

  def purchases_params
    
    params.require(:purchases_address).permit(:post_code, :delivery_area_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
  def move_to_index_sold_out
    redirect_to root_path  unless @item.purchase.blank?
  end
end
