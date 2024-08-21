class WishlistsController < ApplicationController

  def index
    @wishlistitems = WishlistItem.all
  end
end
