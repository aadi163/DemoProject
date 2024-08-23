class UseraddressesController < ApplicationController
before_action :find_address , only: [:edit , :update , :destroy]

  def index
    @useraddresses = Useraddress.all
  end

  def create_address
    useraddress = Useraddress.new(useraddress_params)
    useraddress.save
  end

  def edit
  end

  def update
    if @useraddress.update(useraddress_params)
      redirect_to order_item_path
    else
      render :edit
    end
  end

  def destroy
    if @useraddress.destroy
      redirect_to order_item_path
    end
  end


  private
  
  def useraddress_params
    params.permit(:name, :phonenumber, :address , :city, :state , :pincode ,:user_id)
  end

  def find_address
    @useraddress = Useraddress.find(params[:id])
  end
end
