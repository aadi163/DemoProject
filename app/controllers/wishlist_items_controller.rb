class WishlistItemsController < ApplicationController
  before_action :find_id  , only: [:addtowishlist]
  before_action :authenticate_user! , only: [:addtowishlist]


  def addtowishlist
    wishlist = current_user.wishlist || current_user.create_wishlist
    @wishlist_item = wishlist.wishlist_items.find_or_initialize_by(product: @product)

    if @wishlist_item.save
      redirect_to wishlists_path
    else
      redirect_to product_path
    end
  end

  def destroy
    wishlist_item = WishlistItem.find(params[:id])
    if wishlist_item.destroy
      redirect_to wishlists_path
    end
  end

  private

  def find_id
    @product = Product.find(params[:id])
  end
end
