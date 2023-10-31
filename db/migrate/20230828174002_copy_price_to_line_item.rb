class CopyPriceToLineItem < ActiveRecord::Migration[7.0]
  def change
    LineItem.all.each do |line_item|
      product = Product.find_by(id: line_item.product_id)
      line_item.price = product.price
      line_item.save
    end
  end
end
