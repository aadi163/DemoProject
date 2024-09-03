class WishlistsController < ApplicationController
  before_action :authenticate_user! 

  def index
    wishlist = Wishlist.where(user_id: current_user.id)
    @wishlistitems = WishlistItem.where(wishlist_id: wishlist)
  end
end
