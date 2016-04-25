class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  
  def total
    total = 0

    self.line_items.each do |item|
      item_price = Item.find_by(:id => item.item_id)
      total = (item_price.price * item.quantity) + total
    end

    total
  end

  def add_to_cart
    self << line_items
  end

  def checkout
    self.status = "submitted"
    change_inventory
  end

  def change_inventory
    if self.status = "submitted"
    self.line_items.each do |line_item| 
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end
  end

end
