class WishlistItemsController < ApplicationController
  before_action :authenticate_user! 

  def add_to_wishlist
    wishlist = current_user.wishlist || current_user.create_wishlist
    wishlist_item = wishlist.wishlist_items.find_or_initialize_by(product: @product)
    @product = Product.find(params[:id])
    if wishlist_item.save
      redirect_to wishlists_path
    end
  end

  def destroy
    wishlist_item = WishlistItem.find(params[:id])
    if wishlist_item.destroy
      redirect_to wishlists_path
    end
  end
end
