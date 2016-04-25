class LineItemsController < ApplicationController

  def new
  end

  def create
    initialize_cart
    @line_item = LineItem.create(
      :item_id => params[:item_id],
      :cart_id => @cart.id,
      :quantity => 1
      )

    redirect_to store_path
  end

end
