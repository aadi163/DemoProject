class WishlistsController < ApplicationController
  before_action :authenticate_user! 

  def index
    wishlists = Wishlist.where(user_id: current_user.id)
    @wishlist_items = WishlistItem.where(wishlist_id: wishlists.ids)
  end
end
