class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @purchases_address= PurchasesAddress.new
  end


  def create
    
    @item = Item.find(params[:item_id])
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

  
end
