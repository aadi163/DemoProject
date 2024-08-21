class WishlistItemsController < ApplicationController
  def addtowishlist
    wishlist = current_user.wishlist || current_user.create_wishlist
    product = @product.find(params[:id])
    @wishlist_item = wishlist.wishlist_items.find_or_initialize_by(product: product)

    if @wishlist_item.save
      redirect_to wishlists_path
    else
      redirect_to product_path
    end
  end
end
