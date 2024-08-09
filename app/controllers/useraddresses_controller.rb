class UseraddressesController < ApplicationController
before_action :find_product

  def index
    @useraddresses = Useraddress.all
  end

  def new
    @useraddress = Useraddress.new
    @useraddresses = Useraddress.all
  end

  def create
    @useraddress = Useraddress.new(useraddress_params)
    if @useraddress.save
      redirect_to new_useraddress_path
    else
      render :new
    end
  end

  def edit
    @useraddress = Useraddress.find(params[:id])
  end

  def update
    @useraddress = Useraddress.find(params[:id])
    if @useraddress.update(useraddress_params)
      redirect_to useraddresses_path
    else
      render :edit
    end
  end

  private
  
  def useraddress_params
    params.require(:useraddress).permit(:name, :phonenumber, :address , :city, :state , :pincode ,:user_id)
  end

  def find_product
    @product = Product.find_by(params[:id])
  end


end
